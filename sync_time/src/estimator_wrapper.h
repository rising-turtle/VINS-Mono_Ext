/*
    Jan. 14 2018, He Zhang, hxzhang1@ualr.edu 

    wrapper of estimator, make it output the result of initialization, 
    then output an error 

*/

#pragma once 

#include "estimator.h"
#include "imu_structure.h"
#include <vector>
#include <map>
#include <Eigen/Dense>

using namespace std; 

class Estimator;

class CEstimator
{
public:
    CEstimator();
    virtual ~CEstimator(); 
    
    double errInitCalib(vector<map<int, vector<pair<int, Eigen::Vector3d>> >>& vfeat,  vector<std_msgs::Header> vheader, 
    vector<vector<CIMUData>>& imu_data); // use the drift from TIC as error 
    
    Estimator mEstimator;
    double mIMUTime;
    void sendIMU(CIMUData& imu_msg); 
    void reset();  
};

