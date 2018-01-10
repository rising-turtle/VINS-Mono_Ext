/*
    Jan. 9 2018, He Zhang, hxzhang1@ualr.edu 
    input: 
	1. folder dir, containing: timestamp.txt, /color 
	2. imu_vn100.log
    output:
	imu's time_shift [ms]
*/

#include <ros/ros.h>
#include <fstream>
#include <string>
#include <opencv2/opencv.hpp>
#include "track_feature.h"

using namespace std; 

extern bool readImg(string fname, map<string, string>& res, int from, int to);

string g_dir(""); 
string g_imu_file(""); 
int g_from = 50; 
int g_cnt = 50; 

string g_cam_file("/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/config/robocane_config.yaml"); 

int main(int argc, char* argv[])
{
    ros::init(argc, argv, "sync_time"); 
    ros::NodeHandle n; 
    ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);

    if(argc < 3)
    {
	ROS_WARN("usage: ./sync_time dir imu_vn100.log [from] [cnt]"); 
	return -1; 
    }
    g_dir = argv[1]; 
    g_imu_file = argv[2]; 
    if(argc >= 4)
    {
	g_from = atoi(argv[3]);
	if(argc >= 5)
	{
	    g_cnt = atoi(argv[4]);
	}
    }
    
    ROS_DEBUG("dir: %s imufile: %s from: %d to: %d", g_dir.c_str(), g_imu_file.c_str(), g_from, g_from + g_cnt); 
    
    // 1. first read img 
    map<string, string> imgList;
    if(!readImg(g_dir + "/timestamp.txt", imgList, g_from, g_from + g_cnt))
    {
	ROS_ERROR("main_sync_time failed to readImg!");
	return -1; 
    }
    
    // 2. extract and track good features from these imgs
    cv::Mat img; 
    int cnt = 0; 
    CTrackFeat tracker; 
    tracker.readCamIntrinsicParam(g_cam_file); // set camera before use
    for(auto &it : imgList)
    {
	string img_name = g_dir + "/" + it.second;
	++cnt; 
	ROS_DEBUG("main_sync_time: read %d img %s ",g_from + cnt, img_name.c_str());
	img = cv::imread(img_name, -1); 
	cv::imshow("raw", img); 
	cv::waitKey(100); 
	tracker.readImage(img); 
	cv::Mat tracked_img = tracker.showTrack(); 
	cv::imshow("tracked", tracked_img);
	cv::waitKey(100); 
    }
    return 0; 
}
