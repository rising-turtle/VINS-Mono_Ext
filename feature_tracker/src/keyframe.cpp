/*
    Dec. 2 2017, He Zhang, hxzhang1@ualr.edu 

    keyframe structure 
    
*/

#include "keyframe.h"
#include "../freak/freak.h"
#include "../freak/hammingseg.h"
#include <opencv2/legacy/legacy.hpp>

using namespace std;

CKeyFrame::CKeyFrame(){}
CKeyFrame::~CKeyFrame(){}

void CKeyFrame::describe(cv::Mat& img, vector<cv::KeyPoint>& kpts, cv::Mat& desc)
{
    cv_ext::FREAK extractor; 
    // extractor.compute(mImg, mvKPts, mDiscriptor); 
    desc = cv::Mat(); 
    extractor.compute(img, kpts, desc); 
    return ;
}

void CKeyFrame::describe()
{
     return describe(mImg, mvKPts, mDiscriptor); 
}
