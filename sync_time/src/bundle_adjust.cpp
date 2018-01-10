/*
    Jan. 9 2018, He Zhang, hxzhang1@ualr.edu 

    input: bunch of images
    output: relative rotation between these images

*/

CBundleAdjust::CBundleAdjust(){}
CBundleAdjust::~CBundleAdjust(){}


bool CBundleAdjust::initialStructure()
{
    // global sfm 
    Quaterniond Q[mFrameCnt + 1]; 
    Vector3d T[mFrameCnt + 1]; 
    map<int, Vector3d> sfm_tracked_pts; 
    vector<SFMFeature> sfm_f; 
    
    for(auto &it_per_id : mFeatManager.mvFeat )
    {
	int j = it_per_id.start_frame - 1; 
	SFMFeature tmp_feat; 
	tmp_feat.state = false; 
	tmp_feat.id = it_per_id.feature_id; 
	for(int i=0; i<it_per_id.frame_inc_num.size(); i++)
	{
	    j = it_per_id.start_frame + it_per_id.frame_inc_num[i]; 
	    Vector3d pt_j= it_per_id.feature_per_frame[i].point; 
	    tmp_feat.observation.push_back(make_pair(j, Eigen::Vector2d{pt_j.x(), pt_j.y()}));
	}
	sfm_f.push_back(tmp_feat); 
    }
    Matrix3d relative_R; 
    Matrix3d relative_t; 
    
    int l; 
    if(!relativePose(relative_R, relative_t, l))
    {
	ROS_INFO("Not enough features or parallax; choose another range"); 
	return false; 
    }

    GlobalSFM sfm; 
    if(!sfm.construct(mFrameCnt+1, Q, T, l, 
	    relative_R, relative_t, sfm_f, sfm_tracked_pts));
    {
	ROS_DEBUG("global SFM failed !");
	return false; 
    } 
    
    // solve pnp for all frame 
    // map<double, ImageFrame>::iterator fit; 
    // map<int, Vector3d>::iterator it; 
    // fit = mmAllFrames.begin(); 
    // for(int i=0; fit != mmAllFrames.end(); ++fit)
    {
	
    }

    return true; 
 }
