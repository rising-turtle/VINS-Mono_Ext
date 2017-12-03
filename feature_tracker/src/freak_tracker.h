/*
    Dec. 2 2017, He Zhang, hxzhang1@ualr.edu 

    add keyframe, freak discriptor, add freak match scheme 

*/

#pragma once

#include <queue>
#include "feature_tracker.h"

class CKeyFrame; 

class CFreakTracker : public FeatureTracker
{
public:
    CFreakTracker();
    ~CFreakTracker(); 
    
    // handle new image following FREAK feature match pipeline, 
    // yet, extract feature using good_feature_to_track
    void readImage(const cv::Mat & _img); 

    // check out whether a new key frame is needed 
    bool needNewKeyFrame();  
    CKeyFrame* createNewKeyFrame(); 

    std::queue<CKeyFrame*> mqKFs; // queue to store KFs 
};
