/*
    Jan. 12 2018, He Zhang, hxzhang1@ualr.edu 

    IMU data structure 

*/

#include "imu_structure.h"

CIMUData::CIMUData(){}
CIMUData::CIMUData(double timestamp, vector<double> reading)
{
    mTimestamp = timestamp; 
    m_ax = reading[0]; 
    m_ay = reading[1]; 
    m_az = reading[2]; 
    m_wx = reading[3];
    m_wy = reading[4];
    m_wz = reading[5]; 
}

CIMUData::~CIMUData(){}
