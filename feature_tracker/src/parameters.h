#pragma once
#include <ros/ros.h>
#include <opencv2/highgui/highgui.hpp>

extern int ROW;
extern int COL;
extern int FOCAL_LENGTH;
const int NUM_OF_CAM = 1;


extern std::string IMAGE_TOPIC;
extern std::string IMU_TOPIC;
extern std::string FISHEYE_MASK;
extern std::vector<std::string> CAM_NAMES;
extern int MAX_CNT;
extern int MIN_DIST;
extern int WINDOW_SIZE;
extern int FREQ;
extern double F_THRESHOLD;
extern int SHOW_TRACK;
extern int STEREO_TRACK;
extern int EQUALIZE;
extern int FISHEYE;
extern bool PUB_THIS_FRAME;

// added 
extern double FEATURE_SIZE;  //	default feature size for calculating discriptor 
extern double NEW_KF_THRESHOLD; // threshold to create new KF 
extern int LEAST_NUM_FOR_PNP;  // Least matches for start PnP 
extern int TRACKED_ENOUGH_FEATURE; // threhold to decide whether enough feature has been tracked 

void readParameters(ros::NodeHandle &n);
