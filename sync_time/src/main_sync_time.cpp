/*
    Jan. 11 2018, He Zhang, hxzhang1@ualr.edu 
    input: 
	1. sfm_result.log, containing: rotation result from vision_sfm
	2. imu_vn100.log, containing: imu readings 
    output:
	imu's time_shift [ms] to best align rotation with SFM's rotation result 
*/

#include <ros/ros.h>
#include <fstream>
#include <string>
// #include <opencv2/opencv.hpp>
using namespace std; 

extern bool read_imu_vn100(string fname, vector<string>& timestamp, vector<vector<double> > & imu); 
extern bool read_sfm_result(string fname, vector<string>& timestamp, vector<vector<double> >& qv);

string g_sfm_result(""); 
string g_imu_file("");
int g_range(1024); // search range +- 1024 ms 

int main(int argc, char* argv[])
{
    ros::init(argc, argv, "sync_time"); 
    ros::NodeHandle n; 
    ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);

    if(argc < 3)
    {
	ROS_WARN("usage: ./sync_time sfm_result.log imu_vn100.log [range]"); 
	return -1; 
    }
    g_sfm_result = argv[1]; 
    g_imu_file = argv[2]; 
    if(argc >= 4)
    {
	g_range = atoi(argv[3]);
    }
    
    ROS_DEBUG("sfm_result: %s imufile: %s range: %d", g_sfm_result.c_str(), g_imu_file.c_str(), g_range); 
    
    // 1. read sfm_result 
    vector<string> sfm_time; 
    vector<vector<double>> sfm_qvs; 
    if(!read_sfm_result(g_sfm_result, sfm_time, sfm_qvs))
    {
	ROS_ERROR("main_sync_time failed to read sfm_result!");
	return -1; 
    }
    
    // 2. read imu readings
    vector<string> imu_time; 
    vector<vector<double>> imu_obs;
    if(!read_imu_vn100(g_imu_file, imu_time, imu_obs))
    {
	ROS_ERROR("main_sync_time: failed to read imu_vn100.log!");
	return -1;
    }
    
    return 0; 
}
