/*
    Jan. 9 2018, He Zhang, hxzhang1@ualr.edu 

    input: bunch of images
    output: relative rotation between these images

*/

#include "bundle_adjust.h"
#include "feature_manager.h"
#include <fstream>

CBundleAdjust::CBundleAdjust(int frame_cnt, bool record_result): 
mFrameCnt(frame_cnt),
mbRecordResult(record_result)
{}
CBundleAdjust::~CBundleAdjust(){}

bool CBundleAdjust::SFM(Eigen::Quaterniond Q[], Eigen::Vector3d T[], CFeatManager* pFM)
{
    map<int, Vector3d> sfm_tracked_pts; 
    vector<SFMFeature> sfm_f; 
    
    for(auto &it_per_id : pFM->mlFeats )
    {
	int j = it_per_id.mStartFrame - 1; 
	SFMFeature tmp_feat; 
	tmp_feat.state = false; 
	tmp_feat.id = it_per_id.mFId; 
	for(int i=0; i<it_per_id.mvFeatPts.size(); i++)
	{
	    // j = it_per_id.start_frame + it_per_id.frame_inc_num[i]; 
	    j++; 
	    Vector3d pt_j= it_per_id.mvFeatPts[i].m_pt; 
	    tmp_feat.observation.push_back(make_pair(j, Eigen::Vector2d{pt_j.x(), pt_j.y()}));
	}
	sfm_f.push_back(tmp_feat); 
    }
    Matrix3d relative_R; 
    Vector3d relative_t; 
    
    int l; 
    if(!relativePose(relative_R, relative_t, l, pFM))
    {
	ROS_INFO("Not enough features or parallax; choose another range"); 
	return false; 
    }
    
    ROS_DEBUG("bundle_adjust: relativePose succeed, l = %d ", l); 
    GlobalSFM sfm; 
    if(!sfm.construct(mFrameCnt+1, Q, T, l, 
	    relative_R, relative_t, sfm_f, sfm_tracked_pts))
    {
	ROS_DEBUG("global SFM failed !");
	return false; 
    } 
    
    ROS_DEBUG("global SFM succeed !");
    return true; 
}

bool CBundleAdjust::SFM(CFeatManager* pFM, vector<string> timestamp)
{
    // global sfm 
    Quaterniond Q[mFrameCnt + 1]; 
    Vector3d T[mFrameCnt + 1]; 
    if(!SFM(Q,T, pFM))
	return false;
   // write 
    if(mbRecordResult)
    {
	cout <<"mFrameCnt = "<<mFrameCnt<<" timestamp.size() = "<<timestamp.size()<<endl;
	assert(mFrameCnt + 1  == timestamp.size());
	ofstream rf("sfm_result.log"); 
	for(int i=0; i<= mFrameCnt; i++)
	{
	    rf << timestamp[i]<<" "<< Q[i].x()<<" "<<Q[i].y() <<" "<<Q[i].z()<<" "<<Q[i].w()<<endl; 
	}
	rf.close(); 
    }
    return true; 
 }

bool CBundleAdjust::relativePose( Eigen::Matrix3d &relative_R, Eigen::Vector3d &relative_T, int &l, CFeatManager* pFM)
{
        // find previous frame which contians enough correspondance and parallex with newest frame
    for (int i = 0; i <= mFrameCnt; i++)
    {
        vector<pair<Vector3d, Vector3d>> corres;
        corres = pFM->getCorresponding(i, mFrameCnt);
	 ROS_DEBUG("bundle_adjust: i = %d mFrameCnt = %d, corres.size() = %d", i, mFrameCnt, corres.size());
        if (corres.size() > 20)
        {
            double sum_parallax = 0;
            double average_parallax;
            for (int j = 0; j < int(corres.size()); j++)
            {
                Vector2d pts_0(corres[j].first(0), corres[j].first(1));
                Vector2d pts_1(corres[j].second(0), corres[j].second(1));
                double parallax = (pts_0 - pts_1).norm();
                sum_parallax = sum_parallax + parallax;

            }
            average_parallax = 1.0 * sum_parallax / int(corres.size());
	     ROS_DEBUG("bundle_adjust: i = %d corres.size() = %d, average_parallax = %lf", i, corres.size(), average_parallax);
            if(average_parallax * 460 > 30 && m_estimator.solveRelativeRT(corres, relative_R, relative_T))
            {
                l = i;
                ROS_DEBUG("average_parallax %f choose l %d and newest frame to triangulate the whole structure", average_parallax * 460, l);
                return true;
            }
        }
    }
    return false;
}

