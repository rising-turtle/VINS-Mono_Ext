/*
    Jan. 12 2018, He Zhang, hxzhang1@ualr.edu 
    
    shift imu's timestamp to minimize rotation_difference 

*/

#include "shift_imu.h"
#include "rotation_error.h"
#include <string>
#include <iostream>
#include <assert.h>
#include <sstream>
#include <fstream>

namespace{

double toSec(string time)
{
    string secs = time.substr(0, 10); 
    string nanosecs = time.substr(11, 9); 
    return (std::stoi(secs) + std::stoi(nanosecs) * 1e-9); 
}

}

CShiftIMU::CShiftIMU():
mpRotDiff(new CRotDiff)
{}
CShiftIMU::~CShiftIMU()
{
    if(mpRotDiff){ delete mpRotDiff; mpRotDiff = 0;}
}

void CShiftIMU::prepareSFMData(vector<string>& sfm_time, vector<vector<double>>& sfm_data)
{
    m_sfm_time.resize(sfm_time.size()); 
    for(int i=0; i< sfm_time.size(); i++)
	m_sfm_time[i] = toSec(sfm_time[i]); 
    m_sfm_qvs = sfm_data; 
    return ; 
}

void CShiftIMU::prepareIMUData(vector<string>& imu_time, vector<vector<double>>& imu_data)
{
    m_imu_time.resize(imu_time.size()); 
    m_imu_data.reserve(imu_data.size()); 

    for(int i=0; i<imu_time.size(); i++)
    {
	m_imu_time[i] = toSec(imu_time[i]);
	CIMUData imu_d(m_imu_time[i], imu_data[i]); 
	m_imu_data.push_back(imu_d);
    }
    return ; 
}

double CShiftIMU::findIt(int range)
{
    double min_rot_diff = 100000000; 
    int step = 16;
    double ret = -1; 
    int cur_range = range;
    int fi = -cur_range; 
    int ti = cur_range; 
    int min_i ; 
    while(1)
    {
	stringstream ss;
	ss<<"step_"<<step<<".log";
	ofstream ouf(ss.str().c_str()); 
	for(int i=fi; i<=ti; i+=step)
	{
	    double sf = (i)*0.001; 
	    double rot_diff = shiftIt(sf); 
	    if(rot_diff < min_rot_diff)
	    {
		min_rot_diff = rot_diff;
		ret = sf; 
		min_i = i; 
		cout <<"min_i = "<<i<<" rot_diff: "<<min_rot_diff<<endl;
	    }
	    // cout <<" shift_imu: shift: "<<sf*1000<<" ms rot_diff: "<<rot_diff<<endl;
	    ouf << i<<" "<<rot_diff<<endl;
	}
	ouf.close(); 
	if(step == 1) // find it, return 
	{
	    break; 
	}else{
	    step/=2; 
	    fi = min_i - 50 * step;
	    ti = min_i + 50 * step; 
	}
    }
    return ret; 
}

double CShiftIMU::shiftIt(double sf)
{
    vector<vector<CIMUData>> imu_collections; 
    if(!findMatchByShift(sf, imu_collections))
    {
	cerr<<"shift_imu: shift "<<sf*1000.<<" ms failed!"<<endl;
	return -1.;
    }
    return mpRotDiff->diffRot(m_sfm_qvs, imu_collections);
}

int CShiftIMU::closeTo(double timestamp, int from, double sf)
{
    int ret = -1;
    for(int i=from; i<m_imu_data.size()-1; i++)
    {
	if(m_imu_data[i+1].mTimestamp + sf >= timestamp)
	{
	    ret = i; 
	    break;
	}
    }
    return ret; 
}


bool CShiftIMU::findMatchByShift(double sf, vector<vector<CIMUData>>& imu_collections) // given sf ms, find out matched IMU collections
{
    assert(m_sfm_time.size() > 0); 
    imu_collections.clear();
    int from_j = closeTo(m_sfm_time[0], 0, sf); 
    for(int i=1; i<m_sfm_time.size(); i++)
    {
	int to_j = closeTo(m_sfm_time[i], from_j, sf); 
	if(to_j < 0 || to_j < from_j || from_j < 0)
	{
	    cerr <<"shift_imu: something error happens: to_j: "<<to_j<<" from_j: "<<from_j<<endl;
	    return false; 
	}
	// collect imu readings
	vector<CIMUData> tmp; 
	for(int j = from_j; j<=to_j; j++ )
	{
	    tmp.push_back(m_imu_data[j]); 
	}
	imu_collections.push_back(tmp); 
	// for next loop
	from_j = to_j; 
    }
    // cout <<"shift_imu: collect "<<imu_collections.size()<<" imu datasets!"<<endl; 
    return true; 
}





