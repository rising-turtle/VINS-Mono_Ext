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
    std::vector<cv::KeyPoint> mvKPts;  // location of the key points in the mImg
    cv::Mat mDiscriptor; 	// store key points' discriptors 
    std::vector<int> mIds; // key point's id 
};
