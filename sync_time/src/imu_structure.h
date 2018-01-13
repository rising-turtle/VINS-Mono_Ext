/*
    Jan. 12 2018, He Zhang, hxzhang1@ualr.edu 

    IMU data structure 

*/
#pragma once 

#include <vector>
#include <string>

using namespace std; 

class CIMUData
{
public:
    CIMUData();
    CIMUData(double timestamp, vector<double> data);
    ~CIMUData(); 

    double mTimestamp; 
    double m_ax; 
    double m_ay;
    double m_az;
    double m_wx;
    double m_wy;
    double m_wz;
};
