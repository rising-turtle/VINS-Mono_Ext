/*
    Jan. 15 2018, He Zhang, hxzhang1@ualr.edu 

    shift imu's timestamp to minimize estimator's TIC difference

*/

#pragma once 
#include <vector>
#include <map>
#include <string>
#include "imu_structure.h"
#include "estimator_wrapper.h"

using namespace std; 

class CShiftIMUByTIC 
{
public:
    CShiftIMUByTIC(); 
    virtual ~CShiftIMUByTIC(); 
    
    void prepareFeatData( vector<map<int, vector<pair<int, Vector3d>> >>& vfeat, vector<std_msgs::Header> & header); 
    void prepareIMUData(vector<string>& imu_time, vector<vector<double>>& imu_data);
    virtual double findIt(int range); // find best shift ms
    virtual double shiftIt(double sf); // shift IMU ms, and output rotation difference 
    virtual bool findMatchByShift(double sf, vector<vector<CIMUData>>& ); // given sf ms, find out matched IMU collections
    int closeTo(double timestamp, int from, double sf);

    vector<std_msgs::Header> m_feats_header; 
    vector<map<int, vector<pair<int, Vector3d>> >> m_feats; 
    vector<double> m_imu_time;
    vector<CIMUData> m_imu_data;

    CEstimator mCEstimator; 
};
