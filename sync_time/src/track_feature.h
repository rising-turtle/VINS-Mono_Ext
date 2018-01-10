/*
    Jan. 10 2018, He Zhang, hxzhang1@ualr.edu 
    continuously extract and track features 
input:
    a sequence of images, 
output:
    extracted feature and tracked information  
*/
#include <cstdio>
#include <iostream>
#include <queue>
#include <execinfo.h>
#include <csignal>
#include <vector>

#include <opencv2/opencv.hpp>
#include <eigen3/Eigen/Dense>

#include "camodocal/camera_models/CameraFactory.h"
#include "camodocal/camera_models/CataCamera.h"
#include "camodocal/camera_models/PinholeCamera.h"

using namespace std; 

class CTrackFeat
{
public:
    CTrackFeat(int win_size = 50); 
    ~CTrackFeat(); 
    
    void initParam(); 
    void readImage(const cv::Mat& img); 
    void rejectWithF(); 
    void setMask(); 
    void addPoints();
    cv::Mat showTrack(); 

    cv::Mat mCurImg;
    cv::Mat mPreImg;
    cv::Mat mMask;
    vector<cv::Point2f> mvCurPts;
    vector<cv::Point2f> mvPrePts;
    vector<cv::Point2f> mvNewPts; 
    vector<int> mvIds;
    vector<int> mvTrackCnt;
    
    static int sNId;

    // camera related parameters 
    int COL;
    int ROW; 
    double FOCAL_LENGTH; 
    camodocal::CameraPtr m_camera;
    void readCamIntrinsicParam(const string f); 

    // threshold parameters 
    double MIN_DIST; 
    double F_THRESHOLD; 
    int MAX_CNT; 
    int WINDOW_SIZE; 
};
