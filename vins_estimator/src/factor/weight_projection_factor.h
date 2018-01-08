/*
    Jan. 7 2018, He Zhang, hxzhang1@ualr.edu 
    add weight for projection factor 
*/

#pragma once

#include <ros/assert.h>
#include <ceres/ceres.h>
#include <Eigen/Dense>
#include "../utility/utility.h"
#include "../utility/tic_toc.h"
#include "../parameters.h"

class WeightProjectionFactor : public ceres::SizedCostFunction<2, 7, 7, 7, 1>
{
public:
    WeightProjectionFactor(const Eigen::Vector3d &_pts_i, const Eigen::Vector3d & _pts_j, double count); 
    virtual bool Evaluate(double const * const* parameters, double * residuals, double ** jacobians) const; 
    void check(double** parameters); 

    double mcount; // number of times being observed

    Eigen::Vector3d pts_i, pts_j; 
    Eigen::Matrix<double, 2, 3> tangent_base; 
    static Eigen::Matrix2d sqrt_info; 
    static double sum_t;
};
