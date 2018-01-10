/*
    Jan. 9 2018, He Zhang, hxzhang1@ualr.edu 

    input: bunch of images
    output: relative rotation between these images

*/

#pragma once 

#include <map>

using namespace std; 

class CBundleAdjust
{
public:
    CBundleAdjust();
    ~CBundleAdjust(); 
    
    bool initialStructure(); 
    map<double, ImageFrame> mmAllFrames;
    int mFrameCnt; 
};
