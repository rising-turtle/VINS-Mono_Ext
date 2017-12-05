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
#if CV_SSSE3
    cv::BruteForceMatcher< cv::HammingSeg<30,4> > matcher;
#else 
    cv::BruteForceMatcher<cv::Hamming> matcher; 
#endif
    // extractor.compute(mImg, mvKPts, mDiscriptor); 
    desc = cv::Mat(); 
    extractor.compute(img, kpts, desc); 
    return ;
}

void CKeyFrame::describe()
{
     return describe(mImg, mvKPts, mDiscriptor); 
}
