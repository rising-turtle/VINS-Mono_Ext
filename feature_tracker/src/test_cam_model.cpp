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
bool pixelToBearing(camodocal::CameraPtr& cam, const Eigen::Vector2d& c,Eigen::Vector3d& vec);

int main(int argc, char* argv[])
{
    test_cam_model();
    return 0; 
}

void test_cam_model()
{
    Eigen::Vector2d a(419, 103);
    Eigen::Vector3d b;
    string calib_file = "/home/davidz/work/ros/indigo/src/VINS-Mono_Ext/config/cam_rantan.yaml";
    camodocal::CameraPtr m_camera = camodocal::CameraFactory::instance()->generateCameraFromYamlFile(calib_file);
    cout <<"camera: "<<((camodocal::PinholeCamera*)m_camera.get())->getParameters()<<endl;
    m_camera->liftProjective(a, b);
    cout <<"a: "<<endl<<a<<endl;
    cout <<"b: "<<endl<<b<<endl;

    if(pixelToBearing(m_camera, a, b))
    {
	cout <<"succeed to converge! a: "<<a<<" b: "<<b<<endl; 
    }else
    {
	cout <<"failed to converge!"<<endl; 
    }
    return ;
}


bool pixelToBearing(camodocal::CameraPtr& cam, const Eigen::Vector2d& c,Eigen::Vector3d& vec) 
{
    // Shift origin and scale
    Eigen::Vector2d y;
    camodocal::PinholeCamera* pcam = (camodocal::PinholeCamera*)cam.get();
    const camodocal::PinholeCamera::Parameters& param = pcam->getParameters(); 
    double fx = param.fx(); 
    double fy = param.fy(); 
    double cx = param.cx();
    double cy = param.cy(); 
    
    y(0) = (static_cast<double>(c.x()) - cx) / fx;
    y(1) = (static_cast<double>(c.y()) - cy) / fy;

    // Undistort by optimizing
    const int max_iter = 100;
    const double tolerance = 1e-10; // 1e-10
    Eigen::Vector2d ybar = y; // current guess (undistorted)
    Eigen::Matrix2d J;
    Eigen::Vector2d y_tmp; // current guess (distorted)
    Eigen::Vector2d e;
    Eigen::Vector2d du;
    Eigen::Vector2d tmp_dy; 
    bool success = false;
    for (int i = 0; i < max_iter; i++) {
	// distort(ybar,y_tmp,J);
	pcam->distortion(ybar, tmp_dy, J); 
	y_tmp = ybar + tmp_dy; 
	e = y - y_tmp;
	du = (J.transpose() * J).inverse() * J.transpose() * e;
	ybar += du;
	if (e.dot(e) <= tolerance){
	    success = true;
	    break;
	}else{
	     std::cout<<" y = "<<y<<" y_tmp = "<<y_tmp<<" e = "<<e<<std::endl;
	     std::cout<<"e.dot(e) = "<<e.dot(e)<<" > tolerance: "<<tolerance<<std::endl;
	     std::cout<<"du = "<<du(0)<<", "<<du(1)<<" ybar = "<<ybar(0)<<", "<<ybar(1)<<std::endl;
	}
	if(du!=du)
	{
	    std::cout<<"du = "<<du<<" break!"<<std::endl;
	    // vec = Eigen::Vector3d(y(0), y(1), 1.0).normalized(); 
	    // return true; 
	    break;
	}
    }
    if(success){
	y = ybar;
	// vec = Eigen::Vector3d(y(0),y(1),1.0).normalized();
	vec = Eigen::Vector3d(y(0),y(1),1.0);
    }
    return success;
}




