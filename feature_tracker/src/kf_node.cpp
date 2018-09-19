/*
    Dec. 1 2017, He Zhang, hxzhang1@ualr.edu 

    A node for detecting good feature and describing with freak 

*/


#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/Imu.h>
#include <cv_bridge/cv_bridge.h>
#include <message_filters/subscriber.h>
#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <boost/foreach.hpp>
#include "unistd.h"
#include "parameters.h"
#include "frontend.h"
// #include "feature_tracker.h"
#include "kf_tracker.h"

ros::Publisher pub_img,pub_match;
vector<uchar> r_status;
vector<float> r_err;

// FeatureTracker trackerData[NUM_OF_CAM];
double first_image_time;
int pub_count = 1;
bool first_image_flag = true;

// FeatureTracker trackerData[NUM_OF_CAM];
KFTracker trackerData[NUM_OF_CAM]; 

// get data from bag file 
// string g_bagf = "/home/davidz/work/data/ETAS_2F_640_30/rgb.bag"; 
// string g_bagf = "/home/davidz/work/data/ETAS_F2_640_30/rgb.bag"; 
string g_bagf = ""; 
bool readBag(string bagfile, rosbag::Bag& bag); 
void readBagData(rosbag::Bag& bag, CFrontend& fe); 

template<typename T>
void setParam(ros::NodeHandle &n, std::string name, T v)
{
    n.setParam(name, v); 
    return ;
}

void img_callback3(const sensor_msgs::ImageConstPtr &img_msg);

int main(int argc, char **argv)
{
    ros::init(argc, argv, "kf_tracker");
    ros::NodeHandle n("~");
    ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Info);
    // ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);
    ros::Subscriber sub_img ;

    if(argc >= 2)
    {
	g_bagf = string(argv[1]); 
    }
    
    n.param("bag_file", g_bagf, string(""));

    rosbag::Bag bag; 
    bool useBag = readBag(g_bagf, bag); 
    if(useBag)
    {
	ROS_WARN("freak_node: use bag file %s", g_bagf.c_str());
	// setParam<std::string>(n, "config_file", string("/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/config/robocane_config.yaml"));
	// setParam<std::string>(n, "vins_folder", string("/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/result")); 
    }
    readParameters(n);

    for (int i = 0; i < NUM_OF_CAM; i++)
        trackerData[i].readIntrinsicParameter(CAM_NAMES[i]);

    if(FISHEYE)
    {
	for (int i = 0; i < NUM_OF_CAM; i++)
	{
	    trackerData[i].fisheye_mask = cv::imread(FISHEYE_MASK, 0);
	    if(!trackerData[i].fisheye_mask.data)
	    {
		ROS_INFO("load mask fail");
		ROS_BREAK();
	    }
	    else
		ROS_INFO("load mask success");
	}
    }
    CFrontend fe(&trackerData[0]); 
    // ros::Subscriber sub_img = n.subscribe(IMAGE_TOPIC, 100, img_callback);
    
    // if(readBag(g_bagf, bag))
    if(useBag)
    {
	ROS_WARN("freak_node: succeed to open bagfile %s read from bag!", g_bagf.c_str()); 
	// ROS_INFO("freak_node: wait for start!");
	// cin.ignore();
	// cin.get();
	ROS_INFO("freak_node: start to process bagfile!");
	readBagData(bag, fe); 
    }
    else{
	ROS_WARN("freak_node: subscribe from topic : %s", IMAGE_TOPIC.c_str()); 
	sub_img = n.subscribe(IMAGE_TOPIC, 100, &CFrontend::imgCallback, &fe); 
	// sub_img = n.subscribe(IMAGE_TOPIC, 100, &CFrontend::imgCallback2, &fe); 
	// sub_img = n.subscribe(IMAGE_TOPIC, 100, img_callback3);
    }
    // pub_img = n.advertise<sensor_msgs::PointCloud>("feature", 1000);
    // pub_match = n.advertise<sensor_msgs::Image>("feature_img",1000);
    /*
    if (SHOW_TRACK)
        cv::namedWindow("vis", cv::WINDOW_NORMAL);
    */
        // ros::Subscriber sub_img = n.subscribe(IMAGE_TOPIC, 100, img_callback);

    pub_img = n.advertise<sensor_msgs::PointCloud>("feature", 1000);
    pub_match = n.advertise<sensor_msgs::Image>("feature_img",1000);
    ros::spin();
    return 0;
}
/*
void readBagData(rosbag::Bag& bag, CFrontend& fe)
{
    std::vector<string> topics; 
    topics.push_back(IMAGE_TOPIC); 
    topics.push_back(IMU_TOPIC);
    rosbag::View view(bag, rosbag::TopicQuery(topics)); 
    int cnt = 0; 
    // fe.mbShowTrack = true; // display the matched result 
    ros::NodeHandle n;
    ros::Publisher imu_pub = n.advertise<sensor_msgs::Imu>("/imu0", 1000); 
    ros::Publisher img_pub = n.advertise<sensor_msgs::Image>("/cam0/color", 1000); 
    // ROS_WARN("IMU_TOPIC = %s", IMU_TOPIC.c_str());
    bool first = true; 
    rosbag::MessageInstance m_pre; 
    BOOST_FOREACH(rosbag::MessageInstance m, view)
    {
	if(!ros::ok()) break; 
	if(first)
	{
	    first = false; 
	    // ignore first msg 
	}else
	{
	    if(m_pre.getTopic() == IMU_TOPIC  && m.getTopic() == IMAGE_TOPIC)
	    // if(m_pre.getTopic() == IMU_TOPIC)
	    {
		// Do nothing, since m_pre has been published 
		// imu_pub.publish(m_pre);
		// ros::spinOnce(); 
	    }else if(m_pre.getTopic() == IMU_TOPIC && m.getTopic() == IMU_TOPIC) 	    
	    {
		// publish imu  
		imu_pub.publish(m);
		ros::spinOnce();
	    }
	    else if(m_pre.getTopic() == IMAGE_TOPIC && m.getTopic() == IMAGE_TOPIC)
	    {
		// impossible
		ROS_ERROR("freak_node: impossible!"); 
		goto HANDLE_IMAGE;
	    }else if(m_pre.getTopic() == IMAGE_TOPIC && m.getTopic() == IMU_TOPIC)
	    {
		// publish IMU first, then handle image 
		imu_pub.publish(m); 
		ros::spinOnce(); 

		// publish image 
HANDLE_IMAGE:   img_pub.publish(m_pre); 
		ros::spinOnce(); 

		// receive an image message, extract features 
		sensor_msgs::ImageConstPtr simg = m_pre.instantiate<sensor_msgs::Image>(); 
		fe.imgCallback(simg); 
		usleep(5*1000); // wait 10 ms
	    }
	}
	m_pre = m; 
    }
    return ; 
}*/

void img_callback3(const sensor_msgs::ImageConstPtr &img_msg)
{
    if(first_image_flag)
    {
        first_image_flag = false;
        first_image_time = img_msg->header.stamp.toSec();
    }

    // frequency control
    if (round(1.0 * pub_count / (img_msg->header.stamp.toSec() - first_image_time)) <= FREQ)
    {
        PUB_THIS_FRAME = true;
        // reset the frequency control
        if (abs(1.0 * pub_count / (img_msg->header.stamp.toSec() - first_image_time) - FREQ) < 0.01 * FREQ)
        {
            first_image_time = img_msg->header.stamp.toSec();
            pub_count = 0;
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
            trackerData[i].readImage(ptr->image.rowRange(ROW * i, ROW * (i + 1)));
    }
	
    for (unsigned int i = 0;; i++)
    {
        bool completed = false;
        for (int j = 0; j < NUM_OF_CAM; j++)
            if (j != 1 || !STEREO_TRACK)
                completed |= trackerData[j].updateID(i);
        if (!completed)
            break;
    }

   if (PUB_THIS_FRAME)
   {
        pub_count++;
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
                auto un_pts = trackerData[i].undistortedPoints();
                auto &cur_pts = trackerData[i].cur_pts;
                auto &ids = trackerData[i].ids;
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
            else if (STEREO_TRACK)
            {
                auto r_un_pts = trackerData[1].undistortedPoints();
                auto &ids = trackerData[0].ids;
                for (unsigned int j = 0; j < ids.size(); j++)
                {
                    if (r_status[j])
                    {
                        int p_id = ids[j];
                        hash_ids[i].insert(p_id);
                        geometry_msgs::Point32 p;
                        p.x = r_un_pts[j].x;
                        p.y = r_un_pts[j].y;
                        p.z = 1;

                        feature_points->points.push_back(p);
                        id_of_point.values.push_back(p_id * NUM_OF_CAM + i);
                    }
                }
            }
        }
        feature_points->channels.push_back(id_of_point);
        feature_points->channels.push_back(u_of_point);
        feature_points->channels.push_back(v_of_point);
        ROS_DEBUG("publish %f, at %f", feature_points->header.stamp.toSec(), ros::Time::now().toSec());
        pub_img.publish(feature_points);

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
                    for (unsigned int j = 0; j < trackerData[i].cur_pts.size(); j++)
                    {
                        double len = std::min(1.0, 1.0 * trackerData[i].track_cnt[j] / WINDOW_SIZE);
                        cv::circle(tmp_img, trackerData[i].cur_pts[j], 2, cv::Scalar(255 * (1 - len), 0, 255 * len), 2);
                        //char name[10];
                        //sprintf(name, "%d", trackerData[i].ids[j]);
                        //cv::putText(tmp_img, name, trackerData[i].cur_pts[j], cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 0, 0));
                    }
                }
                else
                {
                    for (unsigned int j = 0; j < trackerData[i].cur_pts.size(); j++)
                    {
                        if (r_status[j])
                        {
                            cv::circle(tmp_img, trackerData[i].cur_pts[j], 2, cv::Scalar(0, 255, 0), 2);
                            cv::line(stereo_img, trackerData[i - 1].cur_pts[j], trackerData[i].cur_pts[j] + cv::Point2f(0, ROW), cv::Scalar(0, 255, 0));
                        }
                    }
                }
            }
            /*
            cv::imshow("vis", stereo_img);
            cv::waitKey(5);
            */
            pub_match.publish(ptr->toImageMsg());
        }
    }
    // ROS_INFO("whole feature tracker processing costs: %f", t_r.toc());
}


void readBagData(rosbag::Bag& bag, CFrontend& fe)
{
    std::vector<string> topics; 
    topics.push_back(IMAGE_TOPIC); 
    topics.push_back(IMU_TOPIC);
    rosbag::View view(bag, rosbag::TopicQuery(topics)); 
    int cnt = 0; 
    // fe.mbShowTrack = true; // display the matched result 
    ros::NodeHandle n;
    ros::Publisher imu_pub = n.advertise<sensor_msgs::Imu>("/imu0", 1000); 
    ros::Publisher img_pub = n.advertise<sensor_msgs::Image>("/cam0/color", 1000); 
    int imu_msg_cnt = 0;
    int img_msg_cnt = 0; 
    ROS_WARN("IMU_TOPIC = %s IMAGE_TOPIC = %s", IMU_TOPIC.c_str(), IMAGE_TOPIC.c_str()); 
    // ROS_WARN("IMU_TOPIC = %s", IMU_TOPIC.c_str());
    BOOST_FOREACH(rosbag::MessageInstance const m, view)
    {
	if(!ros::ok())
	{
	    ROS_INFO("freak_node.cpp: quit!");
	    break; 
	}
	if(m.getTopic() == IMAGE_TOPIC)
	{
	    // publish image 
	    img_pub.publish(m); 
	    ros::spinOnce(); 

	    // receive an image message, extract features 
	    sensor_msgs::ImageConstPtr simg = m.instantiate<sensor_msgs::Image>(); 
	    ROS_DEBUG("freak_node: get %d image message!", cnt++);
	    fe.imgCallback(simg); 

	    if(cnt > 200 || !ros::ok())
	    {
		ROS_WARN("freak_node: cnt = %d break? ", cnt);
		break; 
	    }else
	    {
		// cv_bridge::CvImageConstPtr cv_ptrRGB = cv_bridge::toCvShare(simg, sensor_msgs::image_encodings::BGR8); 
		// cv::namedWindow("raw_image", CV_WINDOW_KEEPRATIO);
		// cv::imshow("raw_image", cv_ptrRGB->image); 
		// cv::waitKey(10); 
	    }
	    usleep(5*1000); // wait 10 ms
	}
	if(m.getTopic() == IMU_TOPIC || ("/"+m.getTopic()) == IMU_TOPIC)
	{
	    // ROS_INFO("OK publish %d IMU_MSG!", imu_msg_cnt++);
	    // publish imu 
	    imu_pub.publish(m); 
	    ros::spinOnce(); 
	    usleep(1*1000); // 1 ms 
	}
    }
    return ; 
}


bool readBag(string bagfile, rosbag::Bag& bag)
{
    if(access(bagfile.c_str(), F_OK) == -1)
    {
	ROS_WARN("bagfile %s not exist, subscribe to : %s", bagfile.c_str(), IMAGE_TOPIC.c_str()); 
	return false; 
    }
    ROS_WARN("freak_node: succeed to load bagfile!");
    bag.open(bagfile, rosbag::bagmode::Read); 
    return true; 
}


