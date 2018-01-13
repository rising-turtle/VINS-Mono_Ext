/*
    Jan. 12 2018, He Zhang, hxzhang1@ualr.edu

    input: 
	1. imu readings
	2. sfm rotation result 
    output:
	1. sum of rotation difference between imu integration and sfm result 
*/

#pragma once 

#include "imu_structure.h"

class CRotDiff
{
public:
    CRotDiff(); 
    virtual ~CRotDiff(); 
    
    double diffRot(vector<vector<double>> &sfm_rot, vector<vector<CIMUData>>& imu_data);
    
    void integrateIMU(vector<vector<double>> & imu_rot, vector<vector<CIMUData>>& imu_data);
};

