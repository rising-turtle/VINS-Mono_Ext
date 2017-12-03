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
#include "parameters.h"
#include "frontend.h"
// #include "feature_tracker.h"
#include "freak_tracker.h"

// FeatureTracker trackerData[NUM_OF_CAM];
CFreakTracker trackerData[NUM_OF_CAM]; 

int main(int argc, char **argv)
{
    ros::init(argc, argv, "freak_tracker");
    ros::NodeHandle n("~");
    // ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Info);
    ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);
    readParameters(n);

    for (int i = 0; i < NUM_OF_CAM; i++)
        trackerData[i].readIntrinsicParameter(CAM_NAMES[i]);

    CFrontend fe(&trackerData[0]); 
    // ros::Subscriber sub_img = n.subscribe(IMAGE_TOPIC, 100, img_callback);
    ros::Subscriber sub_img = n.subscribe(IMAGE_TOPIC, 100, &CFrontend::imgCallback, &fe); 

    // pub_img = n.advertise<sensor_msgs::PointCloud>("feature", 1000);
    // pub_match = n.advertise<sensor_msgs::Image>("feature_img",1000);
    /*
    if (SHOW_TRACK)
        cv::namedWindow("vis", cv::WINDOW_NORMAL);
    */
    ros::spin();
    return 0;
}
