/*
    Jan. 11 2018, He Zhang, hxzhang1@ualr.edu 
    
    manage features 

*/
#include "feature_manager.h"

using namespace Eigen;

CFeatManager::CFeatManager(){}
CFeatManager::~CFeatManager(){}

void CFeatManager::addFeature(int frame_cnt, vector<int> idx, vector<cv::Point2f> undist_pts)
{
    assert(idx.size() == undist_pts.size()); 
    for(int i=0; i<idx.size(); i++)
    {
	int feat_id = idx[i]; 
	Vector3d pt; 
	pt(0) = undist_pts[i].x; pt(1) = undist_pts[i].y; pt(2) = 1.;
	
	auto it = find_if(mlFeats.begin(), mlFeats.end(), [feat_id](const CFeatId &it)
	{
	    return it.mFId == feat_id; 
	});
	if(it == mlFeats.end()) // new feature
	{
	    mlFeats.push_back(CFeatId(feat_id, frame_cnt));
	    mlFeats.back().mvFeatPts.push_back(pt); 
	}else  // old feature with new observation
	{
	    it->mvFeatPts.push_back(pt); 
	}
    }
    return ; 
}

vector<pair<Vector3d, Vector3d>> CFeatManager::getCorresponding(int frame_l, int frame_r)
{
    vector<pair<Vector3d, Vector3d> > corres; 
    for(auto & it: mlFeats)
    {
	if(it.mStartFrame <= frame_l && it.mStartFrame + it.endFrame() >= frame_r)
	{
	    Vector3d a = Vector3d::Zero(); 
	    Vector3d b = Vector3d::Zero(); 
	    int idx_l = frame_l - it.mStartFrame;
	    int idx_r = frame_r - it.mStartFrame; 
	    a = it.mvFeatPts[idx_l].m_pt; 
	    b = it.mvFeatPts[idx_r].m_pt; 
	    corres.push_back(make_pair(a,b)); 
	}
    }
    return corres; 
}



