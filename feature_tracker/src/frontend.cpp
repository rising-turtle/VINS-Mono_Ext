/*
    Dec. 1 2017, He Zhang, hxzhang1@ualr.edu 
    
    frontend - detect, track and match features 

*/
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/Imu.h>
#include <cv_bridge/cv_bridge.h>
#include "frontend.h"
#include "feature_tracker.h"
#include "freak_tracker.h"

CFrontend::CFrontend(FeatureTracker* ftracker) : 
mpFTracker(ftracker),
mPubCnt(1), // bug, it is 1 not 0
mbFirstImgFlag(true),
mbShowTrack(false)
{
    ros::NodeHandle n("~"); 
    mPubImg = n.advertise<sensor_msgs::PointCloud>("feature", 1000);
    mPubMatch = n.advertise<sensor_msgs::Image>("feature_img",1000);
}
CFrontend::~CFrontend()
{}

void CFrontend::imgCallback(const sensor_msgs::ImageConstPtr& img_msg)
{
    if(mbFirstImgFlag)
    {
	mbFirstImgFlag = false;
	mFirstImgTime = img_msg->header.stamp.toSec();
    }

    // frequency control
    if (round(1.0 * mPubCnt / (img_msg->header.stamp.toSec() - mFirstImgTime)) <= FREQ)
    {
	PUB_THIS_FRAME= true;
	// reset the frequency control
	if (abs(1.0 * mPubCnt / (img_msg->header.stamp.toSec() - mFirstImgTime) - FREQ) < 0.01 * FREQ)
	{
	    mFirstImgTime = img_msg->header.stamp.toSec();
	    mPubCnt = 0;
	}
    }
    else
	PUB_THIS_FRAME = false; 

    cv_bridge::CvImageConstPtr ptr = cv_bridge::toCvCopy(img_msg, sensor_msgs::image_encodings::MONO8);
    cv::Mat show_img = ptr->image;
    TicToc t_r;

    // detect & track features 
    // mpFTracker->readImage(ptr->image.clone());
   //  mpFTracker->readImage(ptr->image.rowRange(ROW*0, ROW*1));
    for (int i = 0; i < NUM_OF_CAM; i++)
    {
        ROS_DEBUG("processing camera %d", i);
        if (i != 1 || !STEREO_TRACK)
            mpFTracker->readImage(ptr->image.rowRange(ROW * i, ROW * (i + 1)));
    }
    
    // assign id to new feautres whose id equal -1
    for (unsigned int i = 0;; i++)
    {
	bool completed = false;
	completed |= mpFTracker->updateID(i);
	// completed |= ((CFreakTracker*)mpFTracker)->updateIDWithKF(i);
	if (!completed)
	    break;
    }

    if(PUB_THIS_FRAME)
    {
	pubCurFrame(img_msg); 
    }
    // ROS_INFO("whole feature tracker processing costs: %f", t_r.toc());
}

void CFrontend::imgCallback2(const sensor_msgs::ImageConstPtr& img_msg)
{
    if(mbFirstImgFlag)
    {
	mbFirstImgFlag = false;
	mFirstImgTime = img_msg->header.stamp.toSec();
    }

    // frequency control
    if (round(1.0 * mPubCnt / (img_msg->header.stamp.toSec() - mFirstImgTime)) <= FREQ)
    {
	PUB_THIS_FRAME= true;
	// reset the frequency control
	if (abs(1.0 * mPubCnt / (img_msg->header.stamp.toSec() - mFirstImgTime) - FREQ) < 0.01 * FREQ)
	{
	    mFirstImgTime = img_msg->header.stamp.toSec();
	    mPubCnt = 0;
	}
    }
    else
	PUB_THIS_FRAME = false; 

    cv_bridge::CvImageConstPtr ptr = cv_bridge::toCvCopy(img_msg, sensor_msgs::image_encodings::MONO8);
    cv::Mat show_img = ptr->image;
    TicToc t_r;
    for (int i = 0; i < NUM_OF_CAM; i++)
    {
        ROS_DEBUG("processing camera %d", i);
        if (i != 1 || !STEREO_TRACK)
            mpFTracker->readImage(ptr->image.rowRange(ROW * i, ROW * (i + 1)));
    }

    for (unsigned int i = 0;; i++)
    {
        bool completed = false;
        for (int j = 0; j < NUM_OF_CAM; j++)
            if (j != 1 || !STEREO_TRACK)
                completed |= mpFTracker->updateID(i);
        if (!completed)
            break;
    }

   if (PUB_THIS_FRAME)
   {
   /*
         mPubCnt++; 
        sensor_msgs::PointCloudPtr feature_points(new sensor_msgs::PointCloud);
        sensor_msgs::ChannelFloat32 id_of_point;
        sensor_msgs::ChannelFloat32 u_of_point;
        sensor_msgs::ChannelFloat32 v_of_point;

        feature_points->header = img_msg->header;
        feature_points->header.frame_id = "world";

        vector<set<int>> hash_ids(NUM_OF_CAM);
        for (int i = 0; i < NUM_OF_CAM; i++)
        {
            if (i != 1 || !STEREO_TRACK)
            {
                auto un_pts = mpFTracker->undistortedPoints();
                auto &cur_pts = mpFTracker->cur_pts;
                auto &ids = mpFTracker->ids;
                for (unsigned int j = 0; j < ids.size(); j++)
                {
                    int p_id = ids[j];
                    hash_ids[i].insert(p_id);
                    geometry_msgs::Point32 p;
                    p.x = un_pts[j].x;
                    p.y = un_pts[j].y;
                    p.z = 1;

                    feature_points->points.push_back(p);
                    id_of_point.values.push_back(p_id * NUM_OF_CAM + i);
                    u_of_point.values.push_back(cur_pts[j].x);
                    v_of_point.values.push_back(cur_pts[j].y);
                    ROS_ASSERT(inBorder(cur_pts[j]));
                }
            }
        }
        feature_points->channels.push_back(id_of_point);
        feature_points->channels.push_back(u_of_point);
        feature_points->channels.push_back(v_of_point);
        ROS_DEBUG("publish %f, at %f", feature_points->header.stamp.toSec(), ros::Time::now().toSec());
        mPubImg.publish(feature_points);

        if (SHOW_TRACK)
        {
            ptr = cv_bridge::cvtColor(ptr, sensor_msgs::image_encodings::BGR8);

            //cv::Mat stereo_img(ROW * NUM_OF_CAM, COL, CV_8UC3);
            cv::Mat stereo_img = ptr->image;

            for (int i = 0; i < NUM_OF_CAM; i++)
            {
                cv::Mat tmp_img = stereo_img.rowRange(i * ROW, (i + 1) * ROW);
                cv::cvtColor(show_img, tmp_img, CV_GRAY2RGB);
                if (i != 1 || !STEREO_TRACK)
                {
                    for (unsigned int j = 0; j < mpFTracker->cur_pts.size(); j++)
                    {
                        double len = std::min(1.0, 1.0 * mpFTracker->track_cnt[j] / WINDOW_SIZE);
                        cv::circle(tmp_img, mpFTracker->cur_pts[j], 2, cv::Scalar(255 * (1 - len), 0, 255 * len), 2);
                        //char name[10];
                        //sprintf(name, "%d", trackerData[i].ids[j]);
                        //cv::putText(tmp_img, name, trackerData[i].cur_pts[j], cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 0, 0));
                    }
                }
            }
            mPubMatch.publish(ptr->toImageMsg());
        }*/
        pubCurFrame(img_msg);
    }

}

void CFrontend::pubCurFrame(const sensor_msgs::ImageConstPtr& img_msg)
{
    mPubCnt++; 
    sensor_msgs::PointCloudPtr feature_points(new sensor_msgs::PointCloud);
    sensor_msgs::ChannelFloat32 id_of_point;
    sensor_msgs::ChannelFloat32 u_of_point;
    sensor_msgs::ChannelFloat32 v_of_point;

    feature_points->header = img_msg->header;
    feature_points->header.frame_id = "world";

    set<int> hash_ids; 
    auto un_pts = mpFTracker->undistortedPoints();
    auto &cur_pts = mpFTracker->cur_pts;
    auto &ids = mpFTracker->ids;
    for (unsigned int j = 0; j < ids.size(); j++)
    {
	int p_id = ids[j];
	hash_ids.insert(p_id);
	geometry_msgs::Point32 p;
	p.x = un_pts[j].x;
	p.y = un_pts[j].y;
	p.z = 1;

	feature_points->points.push_back(p);
	// id_of_point.values.push_back(p_id * NUM_OF_CAM + i);
	id_of_point.values.push_back(p_id);
	u_of_point.values.push_back(cur_pts[j].x);
	v_of_point.values.push_back(cur_pts[j].y);
	ROS_ASSERT(inBorder(cur_pts[j]));
    }
    feature_points->channels.push_back(id_of_point);
    feature_points->channels.push_back(u_of_point);
    feature_points->channels.push_back(v_of_point);
    ROS_DEBUG("publish %f, at %f", feature_points->header.stamp.toSec(), ros::Time::now().toSec());
    mPubImg.publish(feature_points); 
    // ros::spinOnce();

    if (SHOW_TRACK)
    {
	cv_bridge::CvImageConstPtr ptr = cv_bridge::toCvCopy(img_msg, sensor_msgs::image_encodings::MONO8);
	cv::Mat show_img = ptr->image;
	ptr = cv_bridge::cvtColor(ptr, sensor_msgs::image_encodings::BGR8);

	//cv::Mat stereo_img(ROW * NUM_OF_CAM, COL, CV_8UC3);
	cv::Mat stereo_img = ptr->image;

	// cv::Mat tmp_img = stereo_img.rowRange(i * ROW, (i + 1) * ROW);
	cv::Mat tmp_img = stereo_img; 
	cv::cvtColor(show_img, tmp_img, CV_GRAY2RGB);
	for (unsigned int j = 0; j < mpFTracker->cur_pts.size(); j++)
	{
	    double len = std::min(1.0, 1.0 * mpFTracker->track_cnt[j] / WINDOW_SIZE);
	    cv::circle(tmp_img, mpFTracker->cur_pts[j], 2, cv::Scalar(255 * (1 - len), 0, 255 * len), 2);
	    //char name[10];
	    //sprintf(name, "%d", trackerData[i].ids[j]);
	    //cv::putText(tmp_img, name, trackerData[i].cur_pts[j], cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 0, 0));
	}
	if(mbShowTrack)
	{
	   cv::namedWindow("vis", CV_WINDOW_KEEPRATIO); 
	   cv::imshow("vis", stereo_img);
	   cv::waitKey(5);
	}
	// pub_match.publish(ptr->toImageMsg());
	mPubMatch.publish(ptr->toImageMsg());
	// ros::spinOnce();
    }
    return ; 
}


