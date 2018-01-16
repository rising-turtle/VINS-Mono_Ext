/*
    Jan. 15 2018, He Zhang, hxzhang1@ualr.edu 

    shift imu's timestamp to minimize estimator's TIC difference

*/

#include "shift_imu2.h"


namespace{

double toSec(string time)
{
    string secs = time.substr(0, 10); 
    string nanosecs = time.substr(11, 9); 
    return (std::stoi(secs) + std::stoi(nanosecs) * 1e-9); 
}
}

CShiftIMUByTIC::CShiftIMUByTIC(){}
CShiftIMUByTIC::~CShiftIMUByTIC(){}

void CShiftIMUByTIC::prepareIMUData(vector<string>& imu_time, vector<vector<double>>& imu_data)
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

void CShiftIMUByTIC::prepareFeatData( vector<map<int, vector<pair<int, Vector3d>> >>& vfeat, vector<std_msgs::Header> & header)
{
    m_feats = vfeat; 
    m_feats_header = header; 
}

double CShiftIMUByTIC::findIt(int range) // find best shift ms
{
    double min_TIC_err = 100000000; 
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
	    double tic_err; 
	    try{
		tic_err = shiftIt(sf); 
		if(tic_err < 0) continue; 
		if(tic_err < min_TIC_err)
		{
		    min_TIC_err = tic_err;
		    ret = sf; 
		    min_i = i; 
		    cout <<"min_i = "<<i<<" tic_err: "<<min_TIC_err<<endl;
		}
		// cout <<" shift_imu: shift: "<<sf*1000<<" ms rot_diff: "<<rot_diff<<endl;
		ouf << i<<" "<<tic_err<<endl;
	    }catch(...)
	    {
		ROS_ERROR("shift_imu2: something is wrong");
		break; 
	    }
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

double CShiftIMUByTIC::shiftIt(double sf) // shift IMU ms, and output rotation difference 
{
    vector<vector<CIMUData>> imu_collections; 
    if(!findMatchByShift(sf, imu_collections))
    {
	cerr<<"shift_imu2: shift "<<sf*1000.<<" ms failed!"<<endl;
	return -1.;
    }
    return mCEstimator.errInitCalib(m_feats, m_feats_header, imu_collections); 
}

int CShiftIMUByTIC::closeTo(double timestamp, int from, double sf)
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

bool CShiftIMUByTIC::findMatchByShift(double sf, vector<vector<CIMUData>> & imu_collections)
{
    imu_collections.clear();
    int from_j = closeTo(m_feats_header[0].stamp.toSec(), 0, sf); 
    for(int i=1; i<m_feats_header.size(); i++)
    {
	int to_j = closeTo(m_feats_header[i].stamp.toSec(), from_j, sf); 
	if(to_j < 0 || to_j < from_j || from_j < 0)
	{
	    cerr <<"shift_imu2: something error happens: to_j: "<<to_j<<" from_j: "<<from_j<<endl;
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




