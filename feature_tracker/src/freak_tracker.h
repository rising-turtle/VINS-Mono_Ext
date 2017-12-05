/*
    Dec. 2 2017, He Zhang, hxzhang1@ualr.edu 

    add keyframe, freak discriptor, add freak match scheme 

*/

#pragma once

#include <vector>
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
    
    // match between keyframes 
    void matchNewKeyFrame(CKeyFrame* pold, CKeyFrame* pnew); 

    std::queue<CKeyFrame*> mqKFs; // queue to store KFs

    // TODO:
    void addKeyFrame(CKeyFrame*); 
    CKeyFrame* mpLastKF; 
protected:
    // match features according to tracked set of features 
    std::vector<cv::DMatch> findMatchByTracked(CKeyFrame * pold, CKeyFrame* pnew, std::vector<cv::DMatch>& m_tracked,
						   std::vector<cv::Point2f>& old_pts, cv::Mat& old_desc, 
						   std::vector<cv::Point2f>& new_pts, cv::Mat& new_desc); 

    // match features by PnP-RANSAC 
    std::vector<cv::DMatch> findMatchByPnP(std::vector<cv::Point2f>& old_pts, cv::Mat& old_desc, 
					       std::vector<cv::Point2f>& new_pts, cv::Mat& new_desc); 
    
    // match features using freak discriptor 
    std::vector<cv::DMatch> matchDesc(cv::Mat& train_desc, cv::Mat& query_desc);
    
    // match the new added points with those in the last keyframe 
    void checkNewPoints(); 

private:
    // compute epipolar error given Fundamental matrix 
    void computeError(cv::InputArray _m1, cv::InputArray _m2, cv::InputArray _model, cv::OutputArray _err); 
};
