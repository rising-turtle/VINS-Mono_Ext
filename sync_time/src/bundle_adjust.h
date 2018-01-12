/*
    Jan. 9 2018, He Zhang, hxzhang1@ualr.edu 

    input: bunch of images
    output: relative rotation between these images

*/

#pragma once 

#include <map>
#include "initial/solve_5pts.h"
#include "initial/initial_sfm.h"
#include "initial/initial_alignment.h"
#include "initial/initial_ex_rotation.h"

using namespace std; 

class CFeatManager; 

class CBundleAdjust
{
public:
    CBundleAdjust(int frame_cnt, bool record_result = true);
    virtual ~CBundleAdjust(); 
    
    bool SFM(Eigen::Quaterniond Q[], Eigen::Vector3d T[], CFeatManager* ); 
    bool SFM(CFeatManager*, vector<string> timestamp );
    bool relativePose( Eigen::Matrix3d &relative_R, Eigen::Vector3d &relative_T, int &l, CFeatManager* pFM); 
    // map<double, ImageFrame> mmAllFrames;
    int mFrameCnt; 
    bool mbRecordResult;    
    MotionEstimator m_estimator;
};
