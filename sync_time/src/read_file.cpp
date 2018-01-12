/*
    Jan. 9 2018, He Zhang, hxzhang1@ualr.edu 
    read files
*/

#include <fstream>
#include <sstream>
#include <iostream>
#include <string>
#include <vector>
#include <map>

using namespace std; 

// read imu_vn100.log
bool read_imu_vn100(string fname, vector<string>& timestamp, vector<vector<double> > & imu)
{
    ifstream inf(fname.c_str()); 
    if(!inf.is_open())
    {
	return false; 
    }
    string time; 
    string s;
    double ax, ay, az, qx, qy, qz; 
    while(!inf.eof())
    {
	getline(inf, s);
	if(!s.empty())
	{
	    stringstream ss; 
	    ss << s; 
	    ss >> time; 
	    ss >> ax; 
	    ss >> ay; 
	    ss >> az;
	    ss >> qx;
	    ss >> qy; 
	    ss >> qz; 
	    timestamp.push_back(time); 
	    vector<double> tmp{ax, ay, az, qx, qy, qz}; 
	    imu.push_back(tmp); 
	}
    }
    cout <<"read_file: read "<<imu.size()<<" imu readings"<<endl; 
    return true; 

}

// read sfm_result.log
bool read_sfm_result(string fname, vector<string>& timestamp, vector<vector<double> >& qv)
{
    ifstream inf(fname.c_str()); 
    if(!inf.is_open())
    {
	return false; 
    }
    string time; 
    string s;
    double qx, qy, qz, qw; 
    while(!inf.eof())
    {
	getline(inf, s);
	if(!s.empty())
	{
	    stringstream ss; 
	    ss << s; 
	    ss >> time; 
	    ss >> qx;
	    ss >> qy; 
	    ss >> qz; 
	    ss >> qw; 
	    timestamp.push_back(time); 
	    vector<double> tmp{qx, qy, qz, qw}; 
	    qv.push_back(tmp); 
	}
    }
    cout <<"read_file: read "<<qv.size()<<" attitudes"<<endl; 
    return true; 
}

// read timestamp.txt
bool readImg(string fname, map<string, string>& res, int from, int to)
{
    ifstream inf(fname.c_str()); 
    if(!inf.is_open())
    {
	return false; 
    }
    string s;
    string t;
    string sRGB; 
    getline(inf, s); // ignore the first line
    int cnt = 0; 
    while(!inf.eof())
    {
	getline(inf, s); 
	if(!s.empty())
	{	
	    stringstream ss; 
	    if(++cnt >= from)
	    {
		ss << s; 
		ss >> t; 
		ss >> sRGB; 
		res[t] = sRGB; 
		if(cnt >= to)
		    break;

	    }	
	}
    }
    cout <<"read_file: read "<<res.size()<<" imgs!"<<endl;
    return true; 
}




