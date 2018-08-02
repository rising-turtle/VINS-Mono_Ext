/*
    test camera model, especially distortion mapping 

*/
#include <cstdio>
#include <iostream>
#include <string>
#include <opencv2/opencv.hpp>
#include <eigen3/Eigen/Dense>

#include "camodocal/camera_models/CameraFactory.h"
#include "camodocal/camera_models/CataCamera.h"
#include "camodocal/camera_models/PinholeCamera.h"

using namespace std; 

void test_cam_model(); 

int main(int argc, char* argv[])
{
    test_cam_model();
    return 0; 
}

void test_cam_model()
{
    Eigen::Vector2d a(419, 103);
    Eigen::Vector3d b;
    string calib_file = "/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/config/tum_vio_config.yaml";
    camodocal::CameraPtr m_camera = camodocal::CameraFactory::instance()->generateCameraFromYamlFile(calib_file);
    m_camera->liftProjective(a, b);
    cout <<"a: "<<endl<<a<<endl;
    cout <<"b: "<<endl<<b<<endl;
}



