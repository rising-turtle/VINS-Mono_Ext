/*
    Dec. 1 2017, He Zhang, hxzhang1@ualr.edu 
    
    frontend - detect, track and match Freak features 

*/

#pragma once 

#include <queue>
#include <vector>
#include <ros/ros.h>

using namespace std; 

// class CFrame; // frame contains feature points, ids, obs_times, 
class FeatureTracker; 

class CFrontend 
{
public:
    CFrontend(FeatureTracker*);
    virtual ~CFrontend();

    // image callback 
    void imgCallback( const sensor_msgs::ImageConstPtr &img_msg); 
    
    // publish this frame 
    void pubCurFrame(const sensor_msgs::ImageConstPtr &img_msg); 
    // bool mbPubThisFrame;  
    
    int mPubCnt;  // count the number of published frames 
    // double mFREQ; // frequency control for publish 

    // queue<CFrame*> mqKF; // keyframes 
    
    FeatureTracker* mpFTracker; // feature tracker 
    
    // parameters 
    double mFirstImgTime ; 
    bool mbFirstImgFlag;
    // bool mbShowTrack;	// whether to publish img with tracked feature for display
    // int mWinSize; 		// number of nodes in the window, outside nodes are marginalized 
    
    // publisher 
    ros::Publisher mPubImg; 
    ros::Publisher mPubMatch; 
};

