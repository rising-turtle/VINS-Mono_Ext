/*
    run check in projectionFactor 

*/

#include "factor/projection_factor.h"
#include "factor/weight_projection_factor.h"
#include <iostream>
#include <Eigen/Dense>
#include <ros/ros.h>

using namespace std; 

void test();
void test2(); 

int main(int argc, char* argv[])
{
    ros::init(argc, argv, "check_project_factor");
    ros::NodeHandle n("~");
    ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);
    // readParameters(n);

    test(); 
    return 1; 
}

void test()
{
    Eigen::Vector3d pts_i(3, 2, 1.); 
    Eigen::Vector3d pts_j(20, 20, 1.); 
    double ** para = new double*[5]; 
    double qx = 0.1; 
    double qy = -0.2; 
    double qz = 0.5; 
    double qw = sqrt(1 - qx*qx - qy*qy - qz*qz); 

    para[0] = new double[7]; // pose_i 
    Eigen::Vector3d Pi(1, 2, 3); 
    Eigen::Quaterniond Qi(qw, qx, qy, qz); 
    para[0][0] = 1; para[0][1] = 2; para[0][2] = 3; 
    para[0][3] = qx; para[0][4] = qy; para[0][5] = qz; para[0][6] = qw; 
    
    para[1] = new double[7]; // pose_j
    para[1][0] = 1.2; para[1][1] = 2.2; para[1][2] = 3.2; 
    qx+=0.1; qy+=0.1; 
    qw = sqrt(1 - qx*qx - qy*qy - qz*qz); 
    Eigen::Vector3d Pj(1.2, 2.2, 3.2); 
    Eigen::Quaterniond Qj(qw, qx, qy, qz); 
    para[1][3] = qx; para[1][4] = qy; para[1][5] = qz; para[1][6] = qw; 
    
    para[2] = new double[7]; // T_I2C
    para[2][0] = 0; para[2][1] = 0; para[2][2] = 0; 
    para[2][3] = 0; para[2][4] = 0; para[2][5] = 0; para[2][6] = 1; 
    
    para[3] = new double[1]; // depth 
    double inv_dep = 0.5; 
    para[3][0] = 0.5;

    para[4] = new double[1]; // count
    para[4][0] = 7.0;

    Eigen::Vector3d pts_camera_i = pts_i/inv_dep; 
    Eigen::Vector3d pts_imu_i = pts_camera_i; 
    Eigen::Vector3d pts_w = Qi*pts_imu_i + Pi; 
    Eigen::Vector3d pts_imu_j = Qj.inverse()*(pts_w - Pj); 
    Eigen::Vector3d pts_cam_j = pts_imu_j; 
    double dep_j = pts_cam_j.z();
    Eigen::Vector3d noise(0.01, 0.02, -0.01); 
    pts_j = (pts_cam_j/dep_j); 
    pts_j += noise; 
    // ProjectionFactor * f = new ProjectionFactor(pts_i, pts_j); 
    // ProjectionFactor::sqrt_info.setIdentity();
    WeightProjectionFactor * f = new WeightProjectionFactor(pts_i, pts_j); 
    WeightProjectionFactor::sqrt_info.setIdentity(); 
    f->check(para); 
    return ; 

}

void test2()
{
    
}
