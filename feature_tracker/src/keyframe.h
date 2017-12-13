/*
    Dec. 2 2017, He Zhang, hxzhang1@ualr.edu 

    keyframe structure 
    
*/

#pragma once

#include <vector>
#include <opencv2/opencv.hpp>


class CKeyFrame 
{
public:
    CKeyFrame();
    virtual ~CKeyFrame(); 
    void describe(); 

    cv::Mat mImg; // camera image
    std::vector<cv::KeyPoint> mvKPts;  // key points in the mImg
    cv::Mat mDiscriptor; 	// store key points' discriptors 
    std::vector<int> mIds; // key point's id 
    int mUnTracked; // number of untracked features
    std::vector<int> mDes2Id; // map from descriptor to Id
    bool mbDiscribed; // whether the freak descriptor has been computed
protected:
    void describe(cv::Mat& img, std::vector<cv::KeyPoint>& kpts, cv::Mat& desc);
};
