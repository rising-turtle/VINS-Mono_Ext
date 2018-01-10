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
		if(cnt >= to)
		    break;
		ss << s; 
		ss >> t; 
		ss >> sRGB; 
		res[t] = sRGB; 
	    }	
	}
    }
    cout <<"read_file: read "<<res.size()<<" imgs!"<<endl;
    return true; 
}



