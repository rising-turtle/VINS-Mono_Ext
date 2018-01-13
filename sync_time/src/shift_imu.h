/*
    Jan. 12 2018, He Zhang, hxzhang1@ualr.edu 
    
    shift imu's timestamp to minimize rotation_difference 

*/
#pragma once 
#include <vector>
#include <string>
#include "imu_structure.h"

using namespace std; 
class CRotDiff; 

class CShiftIMU
{
public:
    CShiftIMU(); 
    virtual ~CShiftIMU(); 
    
    void prepareSFMData(vector<string>& sfm_time, vector<vector<double>>& sfm_data);
    void prepareIMUData(vector<string>& imu_time, vector<vector<double>>& imu_data);
    double findIt(int range); // find best shift ms
    double shiftIt(double sf); // shift IMU ms, and output rotation difference 
    bool findMatchByShift(double sf, vector<vector<CIMUData>>& ); // given sf ms, find out matched IMU collections
    int closeTo(double timestamp, int from, double sf);

    vector<double> m_sfm_time; 
    vector<vector<double>> m_sfm_qvs; 
    vector<double> m_imu_time;
    vector<CIMUData> m_imu_data;

    CRotDiff* mpRotDiff; // given shift seconds, compute the angle difference between IMU's estimation and SFM's estimation

};
