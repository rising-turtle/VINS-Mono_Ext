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
#include "freak_tracker.h"

// FeatureTracker trackerData[NUM_OF_CAM];
CFreakTracker trackerData[NUM_OF_CAM]; 


// get data from bag file 
string g_bagf = "/home/davidz/work/data/ETAS_2F_640_30/rgb.bag"; 
bool readBag(string bagfile, rosbag::Bag& bag); 
void readBagData(rosbag::Bag& bag, CFrontend& fe); 

template<typename T>
void setParam(ros::NodeHandle &n, std::string name, T v)
{
    n.setParam(name, v); 
    return ;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "freak_tracker");
    ros::NodeHandle n("~");
    // ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Info);
    ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);

    if(argc >= 2)
    {
	g_bagf = string(argv[1]); 
    }
    
    rosbag::Bag bag; 
    bool useBag = readBag(g_bagf, bag); 
    if(useBag)
    {
	ROS_WARN("freak_node: use bag file %s", g_bagf.c_str());
	setParam<std::string>(n, "config_file", string("/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/config/robocane_config.yaml"));
	setParam<std::string>(n, "vins_folder", string("/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/result")); 
    }
    readParameters(n);

    for (int i = 0; i < NUM_OF_CAM; i++)
        trackerData[i].readIntrinsicParameter(CAM_NAMES[i]);

    CFrontend fe(&trackerData[0]); 
    // ros::Subscriber sub_img = n.subscribe(IMAGE_TOPIC, 100, img_callback);
    
    // if(readBag(g_bagf, bag))
    if(useBag)
    {
	ROS_WARN("freak_node: succeed to open bagfile %s read from bag!", g_bagf.c_str()); 
	readBagData(bag, fe); 
    }
    else{
	ROS_WARN("freak_node: subscribe from topic : %s", IMAGE_TOPIC.c_str()); 
	ros::Subscriber sub_img = n.subscribe(IMAGE_TOPIC, 100, &CFrontend::imgCallback, &fe); 
    }
    // pub_img = n.advertise<sensor_msgs::PointCloud>("feature", 1000);
    // pub_match = n.advertise<sensor_msgs::Image>("feature_img",1000);
    /*
    if (SHOW_TRACK)
        cv::namedWindow("vis", cv::WINDOW_NORMAL);
    */
    ros::spin();
    return 0;
}

void readBagData(rosbag::Bag& bag, CFrontend& fe)
{
    std::vector<string> topics; 
    topics.push_back(IMAGE_TOPIC); 
    rosbag::View view(bag, rosbag::TopicQuery(topics)); 
    int cnt = 0; 
    fe.mbShowTrack = true; // display the matched result 
    BOOST_FOREACH(rosbag::MessageInstance const m, view)
    {
	if(m.getTopic() == IMAGE_TOPIC)
	{
	    // receive an image message 
	    sensor_msgs::ImageConstPtr simg = m.instantiate<sensor_msgs::Image>(); 
	    ROS_DEBUG("freak_node: get %d image message!", cnt++);
	    fe.imgCallback(simg); 

	    if(cnt > 200 || !ros::ok())
	    {
		break; 
	    }else
	    {
		cv_bridge::CvImageConstPtr cv_ptrRGB = cv_bridge::toCvShare(simg, sensor_msgs::image_encodings::BGR8); 
		cv::namedWindow("raw_image", CV_WINDOW_KEEPRATIO);
		cv::imshow("raw_image", cv_ptrRGB->image); 
		cv::waitKey(10); 
	    }
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


