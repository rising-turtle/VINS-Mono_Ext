/*
    Jan. 14 2018, He Zhang, hxzhang1@ualr.edu 
    
    Try to synchronize timestamp using estimator's initialize process

*/

#include <ros/ros.h>
#include <fstream>
#include <string>
#include <opencv2/opencv.hpp>
#include "parameters.h"
#include "track_feature.h"
#include "shift_imu2.h"

using namespace std; 

extern bool readImg(string fname, map<string, string>& res, int from, int to);

string g_dir(""); 
string g_imu_file(""); 
int g_range = 512; //1024; 
int g_from = 30; 
int g_cnt = 100; 

string g_cam_file("/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/config/robocane_config.yaml"); 
// string g_cam_file("/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/config/robocane_config_320.yaml"); 
extern bool read_imu_vn100(string fname, vector<string>& timestamp, vector<vector<double> > & imu); 

template<typename T>
void setParam(ros::NodeHandle &n, std::string name, T v)
{
    n.setParam(name, v); 
    return ;
}

double toSec(string time)
{
    string secs = time.substr(0, 10); 
    string nanosecs = time.substr(11, 9); 
    return (std::stoi(secs) + std::stoi(nanosecs) * 1e-9); 
}

int main(int argc, char* argv[])
{
    ros::init(argc, argv, "sync_time2"); 
    ros::NodeHandle n; 
    ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);

    if(argc < 3)
    {
	ROS_WARN("usage: ./sync_time2 dir imu_vn100.log [from] [cnt]"); 
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
    
    ROS_DEBUG("dir: %s imu: %s from: %d to: %d", g_dir.c_str(), g_imu_file.c_str(), g_from, g_from + g_cnt); 
    
    // read parameters
    setParam<std::string>(n, "config_file", g_cam_file);
    // setParam<std::string>(n, "vins_folder", string("/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/sync_time/result")); 
    setParam<std::string>(n, "vins_folder", string(""));
    readParameters(n);

    // 1. first read img 
    map<string, string> imgList;
    if(!readImg(g_dir + "/timestamp.txt", imgList, g_from, g_from + g_cnt))
    {
	ROS_ERROR("vision_sfm failed to readImg!");
	return -1; 
    }
    
    // 2. get images and headers
    cv::Mat img; 
    vector<cv::Mat> vImgs;
    vector<std_msgs::Header> vheader; 
    int cnt = 0;
    for(auto &it : imgList)
    {	
	// image features 
	string img_name = g_dir + "/" + it.second;
	ROS_DEBUG("sync_time2: read %d img %s ",g_from + cnt++, img_name.c_str());
	img = cv::imread(img_name, -1); 
	cv::imshow("raw", img); 
	cv::waitKey(100); 
	vImgs.push_back(img); 
	// timestamp 
	std_msgs::Header head; 
	ros::Time rt; 
	rt.fromSec(toSec(it.first)); 
	head.stamp = rt; 
	vheader.push_back(head); 
    }
    ROS_DEBUG("sync_time2: after collect imgs, start to extract features!"); 

    // 3. extract and track good features from these imgs
     CTrackFeat tracker; 
     tracker.readCamIntrinsicParam(g_cam_file); // set camera before use
     vector<map<int, vector<pair<int, Vector3d>> >> vfeat; 
     tracker.getListFeat(vImgs, vfeat); 

    // 4. collect imu data 
    CShiftIMUByTIC shift_imu;
    ROS_DEBUG("sync_time2: construction CShiftIMUByTIC"); 

    shift_imu.prepareFeatData( vfeat, vheader); 
    vector<string> imu_time; 
    vector<vector<double>> imu_obs;
    if(!read_imu_vn100(g_imu_file, imu_time, imu_obs))
    {
	ROS_ERROR("sync_time2: failed to read imu_vn100.log!");
	return -1;
    }
    shift_imu.prepareIMUData(imu_time, imu_obs); 
    ROS_DEBUG("sync_time2: finish collect imu data, start findIt!"); 

    // 5. findIt 
    double time_shift = shift_imu.findIt(g_range); 
    cout <<"sync_time2: time_shift = "<<time_shift<<" s "<<time_shift*1000.<<" ms"<<endl;


    return 0; 
}
