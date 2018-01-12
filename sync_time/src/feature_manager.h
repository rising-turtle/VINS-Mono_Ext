/*
    Jan. 11 2018, He Zhang, hxzhang1@ualr.edu 
    
    manage features 

*/
#pragma once

#include <vector>
#include <list>
#include <opencv2/opencv.hpp>
#include <Eigen/Dense>

using namespace std; 

class CFeatPt
{
public:
    CFeatPt(const Eigen::Vector3d& _pt){
	mz = _pt(2); 
	m_pt = _pt / mz;
    }
    Eigen::Vector3d m_pt;
    double mz; 
};

class CFeatId
{
public:
    const int mFId; 
    int mStartFrame; 
    vector<CFeatPt> mvFeatPts; 
    double mEstimatedDepth;
    int mSolveFlag; // 0: hasn't been solved, 1: solve succeed, 2: solve failed 
    CFeatId(int feat_id, int start_frame): 
    mFId(feat_id), mStartFrame(start_frame), 
    mEstimatedDepth(-1.), mSolveFlag(0)
    {}
    int endFrame(){ return mStartFrame + mvFeatPts.size() - 1; }
};

class CFeatManager 
{
public:
    CFeatManager();
    virtual ~CFeatManager(); 
    
    void addFeature(int frame_cnt, vector<int> idx, vector<cv::Point2f> undist_pts); 
    list<CFeatId> mlFeats; 

    vector<pair<Eigen::Vector3d, Eigen::Vector3d>> getCorresponding(int frame_l, int frame_r); 
};
