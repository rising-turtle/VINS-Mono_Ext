/*
    Jan. 15 2018, He Zhang, hxzhang1@ualr.edu 

    wrapper of estimator, make it output the result of initialization, 
    then output an error 

*/

#include "estimator_wrapper.h"

CEstimator::CEstimator():
mIMUTime(-1)
{}
CEstimator::~CEstimator()
{
}

void CEstimator::reset()
{
    RIC[0] = Eigen::Matrix3d::Identity(); 
    TIC[0] = Eigen::Vector3d(0.063, -0.001, 0.018); 
    mIMUTime = -1;
}

double CEstimator::errInitCalib(vector<map<int, vector<pair<int, Vector3d>> >>& vfeat,  vector<std_msgs::Header> vheader, 
    vector<vector<CIMUData>>& imu_data) 
{
    int N = imu_data.size(); 
    assert(N == vfeat.size() - 1);
    
    double ret = -1.;
    // prepare for initialization 
    reset(); 
    mEstimator.clearState(); 
    mEstimator.setParameter(); 

    for(int i=0; i<N; i++)
    {
	// send IMU data first 
	for(int j=0; j<imu_data[i].size(); j++)
	{
	    sendIMU(imu_data[i][j]); 
	}

	// send feature second 
	// mEstimator.processImage(vfeat[i+1], vheader[i+1]); 
	mEstimator.processImageForInit(vfeat[i+1], vheader[i+1]);

	// check out whether initialization finished 
	if(mEstimator.solver_flag == Estimator::NON_LINEAR) // 
	{
	    // compute TIC difference
	    Vector3d tic = mEstimator.tic[0]; 
	    tic -= TIC[0]; 
	    
	    // 
	    // ret = tic.norm(); 
	    Matrix3d ric = mEstimator.ric[0]; 

	    ret = sqrt((ric(0,0) - 1.)*(ric(0,0) -1.) + (ric(1,1)-1.)*(ric(1,1)-1.) + (ric(2,2)-1.)*(ric(2,2)-1.))*10. + tic.norm();

	    // Quaterniond qic(ric); 
	    // qic.normalize(); 

	    // Quaterniond QIC(1, 0, 0, 0); 
	    // ret = QIC.angularDistance(qic); 
	    
	    break; 
	}
    }
    
    return ret; 
}

void CEstimator::sendIMU(CIMUData& imu_msg)
{
    double t = imu_msg.mTimestamp; 
    if(mIMUTime < 0)
	mIMUTime = t;
    double dt = t - mIMUTime; 
    mIMUTime = t;
    
    mEstimator.processIMU(dt, Vector3d(imu_msg.m_ax, imu_msg.m_ay, imu_msg.m_ax), 
			    Vector3d(imu_msg.m_wx, imu_msg.m_wy, imu_msg.m_wz));
}





