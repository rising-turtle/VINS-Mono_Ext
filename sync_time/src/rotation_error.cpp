/*
    Jan. 12 2018, He Zhang, hxzhang1@ualr.edu

    input: 
	1. imu readings
	2. sfm rotation result 
    output:
	1. sum of rotation difference between imu integration and sfm result 
*/

#include "rotation_error.h"
#include <Eigen/Dense>

using namespace Eigen; 

CRotDiff::CRotDiff(){}
CRotDiff::~CRotDiff(){}

namespace{
    template<typename Derived>
    Eigen::Quaternion<typename Derived::Scalar> deltaQ(const Eigen::MatrixBase<Derived> &theta)
    {
        typedef typename Derived::Scalar Scalar_t;

        Eigen::Quaternion<Scalar_t> dq;
        Eigen::Matrix<Scalar_t, 3, 1> half_theta = theta;
        half_theta /= static_cast<Scalar_t>(2.0);
        dq.w() = static_cast<Scalar_t>(1.0);
        dq.x() = half_theta.x();
        dq.y() = half_theta.y();
        dq.z() = half_theta.z();
        return dq;
    }
}

double CRotDiff::diffRot(vector<vector<double>> &sfm_rot, vector<vector<CIMUData>>& imu_data)
{
    vector<vector<double>> imu_rot; 
    integrateIMU(imu_rot, imu_data); 
    double sum_angle = 0.;
    for(int i=0; i<sfm_rot.size()-1; i++)
    {
	vector<double> & qv = sfm_rot[i];
	Quaterniond Qi(qv[3], qv[0], qv[1], qv[2]);// qw, qx, qy, qz 
	Qi.normalize();
	
	vector<double> & qv1 = sfm_rot[i+1];
	Quaterniond Qj(qv1[3], qv1[0], qv1[1], qv1[2]); 
	Qj.normalize();
	// Matrix3d Rij_sfm = Qi.toRotationMatrix().transpose() * Qj.toRotationMatrix(); 
	Quaterniond Qij_sfm = Qi.inverse() * Qj; 
	Qij_sfm.normalize();

	vector<double>& qv2 = imu_rot[i]; 
	Quaterniond Qij_imu(qv2[3], qv2[0], qv2[1], qv2[2]);
	Qij_imu.normalize(); 
	// Matrix3d Rij_imu = Qij.toRotationMatrix(); 
	// Matrix3d Rdiff = Rij_sfm.transpose() * Rij_imu; 
	sum_angle += Qij_sfm.angularDistance(Qij_imu);
    }
    return sum_angle; 
}

void CRotDiff::integrateIMU(vector<vector<double>> & imu_rot, vector<vector<CIMUData>>& imu_data)
{
    for(int i=0; i<imu_data.size(); i++)
    {
	Matrix3d R = Matrix3d::Identity(); 
	vector<CIMUData>& imu_ri = imu_data[i]; 
	assert(imu_ri.size() > 1);
	
	double cur_t = imu_ri[0].mTimestamp; 
	Vector3d gyr_pri{imu_ri[0].m_wx, imu_ri[0].m_wy, imu_ri[0].m_wz}; 

	for(int j=1; j < imu_ri.size(); j++)
	{
	    CIMUData& imu_d = imu_ri[j]; 
	    double dt = imu_d.mTimestamp - cur_t; 
	    Vector3d gyr_cur{imu_d.m_wx, imu_d.m_wy, imu_d.m_wz}; 
	    Vector3d angular_velocity = 0.5 *(gyr_pri + gyr_cur); 
	    R *= deltaQ(angular_velocity * dt).toRotationMatrix(); 

	    // for the next imu_d
	    gyr_pri = gyr_cur; 
	    cur_t = imu_d.mTimestamp - cur_t; 
	}
	Quaterniond q(R); 
	vector<double> rot{q.x(), q.y(), q.z(), q.w()};
	imu_rot.push_back(rot); 
    }
    return ; 
}







