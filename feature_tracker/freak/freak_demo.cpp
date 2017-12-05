//  demo.cpp
//
//	Here is an example on how to use the descriptor presented in the following paper:
//	A. Alahi, R. Ortiz, and P. Vandergheynst. FREAK: Fast Retina Keypoint. In IEEE Conference on Computer Vision and Pattern Recognition, 2012.
//  CVPR 2012 Open Source Award winner
//
//	Copyright (C) 2011-2012  Signal processing laboratory 2, EPFL,
//	Kirell Benzi (kirell.benzi@epfl.ch),
//	Raphael Ortiz (raphael.ortiz@a3.epfl.ch),
//	Alexandre Alahi (alexandre.alahi@epfl.ch)
//	and Pierre Vandergheynst (pierre.vandergheynst@epfl.ch)
//
//  Redistribution and use in source and binary forms, with or without modification,
//  are permitted provided that the following conditions are met:
//
//   * Redistribution's of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//
//   * Redistribution's in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//   * The name of the copyright holders may not be used to endorse or promote products
//     derived from this software without specific prior written permission.
//
//  This software is provided by the copyright holders and contributors "as is" and
//  any express or implied warranties, including, but not limited to, the implied
//  warranties of merchantability and fitness for a particular purpose are disclaimed.
//  In no event shall the Intel Corporation or contributors be liable for any direct,
//  indirect, incidental, special, exemplary, or consequential damages
//  (including, but not limited to, procurement of substitute goods or services;
//  loss of use, data, or profits; or business interruption) however caused
//  and on any theory of liability, whether in contract, strict liability,
//  or tort (including negligence or otherwise) arising in any way out of
//  the use of this software, even if advised of the possibility of such damage.

#include <iostream>
#include <string>
#include <vector>

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/nonfree/features2d.hpp>
#include <opencv2/legacy/legacy.hpp>

#include "freak.h"
#include "hammingseg.h"

using namespace cv;

void help( char** argv )
{
    std::cout << "\nUsage: " << argv[0] << " [path/to/image1] [path/to/image2] \n"
              << "This is an example on how to use the keypoint descriptor presented in the following paper: \n"
              << "A. Alahi, R. Ortiz, and P. Vandergheynst. FREAK: Fast Retina Keypoint. \n"
              << "In IEEE Conference on Computer Vision and Pattern Recognition, 2012. CVPR 2012 Open Source Award winner \n"
              << std::endl;
}

void computeError( InputArray _m1, InputArray _m2, InputArray _model, OutputArray _err ) ;

void reduceVector(vector<cv::Point2f> &v, vector<uchar> status)
{
    int j = 0;
    for (int i = 0; i < int(v.size()); i++)
        if (status[i])
            v[j++] = v[i];
    v.resize(j);
}

void reduceVector(vector<int> &v, vector<uchar> status)
{
    int j = 0;
    for (int i = 0; i < int(v.size()); i++)
        if (status[i])
            v[j++] = v[i];
    v.resize(j);
}

int main( int argc, char** argv ) {
    // check http://opencv.itseez.com/doc/tutorials/features2d/table_of_content_features2d/table_of_content_features2d.html
    // for OpenCV general detection/matching framework details

    if( argc != 3 ) {
        help(argv);
        return -1;
    }

    // Load images
    Mat imgA = imread(argv[1], CV_LOAD_IMAGE_GRAYSCALE );
    if( !imgA.data ) {
        std::cout<< " --(!) Error reading image " << argv[1] << std::endl;
        return -1;
    }

    Mat imgB = imread(argv[2], CV_LOAD_IMAGE_GRAYSCALE );
    if( !imgA.data ) {
        std::cout << " --(!) Error reading image " << argv[2] << std::endl;
        return -1;
    }

    std::vector<KeyPoint> keypointsA, keypointsB;
    Mat descriptorsA, descriptorsB;
    std::vector<DMatch> matches;

    // DETECTION
    // Any openCV detector such as
    SurfFeatureDetector detector(2000,4);

    // DESCRIPTOR
    // Our proposed FREAK descriptor
    // (roation invariance, scale invariance, pattern radius corresponding to SMALLEST_KP_SIZE,
    // number of octaves, optional vector containing the selected pairs)
    // FREAK extractor(true, true, 22, 4, std::vector<int>());
    cv_ext::FREAK extractor;

    // MATCHER
    // The standard Hamming distance can be used such as
    // BruteForceMatcher<Hamming> matcher;
    // or the proposed cascade of hamming distance using SSSE3
#if CV_SSSE3
    std::cout<<"using SE3 for match!"<<std::endl; 
    BruteForceMatcher< HammingSeg<30,4> > matcher;
#else
    BruteForceMatcher<Hamming> matcher;
#endif

    // detect
    double t = (double)getTickCount();
    detector.detect( imgA, keypointsA );
    detector.detect( imgB, keypointsB );
    t = ((double)getTickCount() - t)/getTickFrequency();
    std::cout << "detection time [s]: " << t/1.0 << std::endl;

    // extract
    t = (double)getTickCount();
    extractor.compute( imgA, keypointsA, descriptorsA );
    extractor.compute( imgB, keypointsB, descriptorsB );
    t = ((double)getTickCount() - t)/getTickFrequency();
    std::cout << "extraction time [s]: " << t << std::endl;

    // match
    t = (double)getTickCount();
    matcher.match(descriptorsA, descriptorsB, matches);
    t = ((double)getTickCount() - t)/getTickFrequency();
    std::cout << "matching time [s]: " << t << std::endl;
    
    double tsize = 0; 
    for(int i=0; i<keypointsA.size(); i++)
    {
	tsize += keypointsA[i].size; 
    }
    std::cout <<"mean feature size : "<<tsize/((double)keypointsA.size()) << std::endl; 

    // Draw matches
    Mat imgMatch;
    drawMatches(imgA, keypointsA, imgB, keypointsB, matches, imgMatch);

    namedWindow("matches", CV_WINDOW_KEEPRATIO);
    imshow("matches", imgMatch);
    // waitKey(0);

    // RANSAC remove outliers 
    vector<uchar> status;
    int N_matched = matches.size(); 
    vector<Point2f> pre_pts(N_matched);
    vector<Point2f> cur_pts(N_matched); 
    for(int i=0; i<N_matched; i++)
    {
	DMatch& m = matches[i]; 
	pre_pts[i] = keypointsA[m.queryIdx].pt; 
	cur_pts[i] = keypointsB[m.trainIdx].pt; 
    }
    double F_THRESHOLD = 2.0; 
    t = (double)getTickCount();
    cv::Mat F_model = cv::findFundamentalMat(pre_pts, cur_pts, cv::FM_RANSAC, F_THRESHOLD, 0.99, status); 
    t = ((double)getTickCount() - t)/getTickFrequency();
    std::cout << "findFundamentalMat FM_RANSAC time [s]: " << t << std::endl;
 
    cout <<"F_model using FM_RANSAC: "<<endl<<F_model<<endl; 
    
    // check out error 
    vector<float> err; 
    computeError(pre_pts, cur_pts, F_model, err); 

    vector<DMatch> tmp_match(pre_pts.size()); 
    int k = 0; 
    for(unsigned int i=0; i<status.size(); i++)
    {
	if(status[i]) // this match is kept 
	{
	    tmp_match[k++] = matches[i];
	    // cout <<"### inlier error : "<<err[i]<<endl; 
	}else
	{
	    // cout <<"!!! outlier error: "<<err[i]<<endl;
	}
    }
    tmp_match.resize(k);
 
    // compute model again using inliers 
    reduceVector(pre_pts, status);
    reduceVector(cur_pts, status); 
    t = (double)getTickCount();
    cv::Mat F2_model = cv::findFundamentalMat(pre_pts, cur_pts, FM_8POINT, F_THRESHOLD, 0.99, status); 
    t = ((double)getTickCount() - t)/getTickFrequency();
    std::cout << "findFundamentalMat FM_RANSAC time [s]: " << t << std::endl;
    cout <<"F2_model using FM_8POINT: "<<endl<<F2_model<<endl; 

    // check out error 
    vector<float> err2; 
    computeError(pre_pts, cur_pts, F2_model, err2); 
    for(int i=0; i<err2.size(); i++)
    {
	// cout<<"err2[i] = "<<err2[i]<<endl; 
    }

    // Draw matches
    Mat imgInlierMatch;
    drawMatches(imgA, keypointsA, imgB, keypointsB, tmp_match, imgInlierMatch);

    namedWindow("matches_inlier", CV_WINDOW_KEEPRATIO);
    imshow("matches_inlier", imgInlierMatch);
    waitKey(0);

   return 1; 
}


  void computeError( InputArray _m1, InputArray _m2, InputArray _model, OutputArray _err ) 
    {
        Mat __m1 = _m1.getMat(), __m2 = _m2.getMat(), __model = _model.getMat();
        int i, count = __m1.checkVector(2);
        const Point2f* m1 = __m1.ptr<Point2f>();
        const Point2f* m2 = __m2.ptr<Point2f>();
        const double* F = __model.ptr<double>();
        _err.create(count, 1, CV_32F);
        float* err = _err.getMat().ptr<float>();

        for( i = 0; i < count; i++ )
        {
            double a, b, c, d1, d2, s1, s2;

            a = F[0]*m1[i].x + F[1]*m1[i].y + F[2];
            b = F[3]*m1[i].x + F[4]*m1[i].y + F[5];
            c = F[6]*m1[i].x + F[7]*m1[i].y + F[8];

            s2 = 1./(a*a + b*b);
            d2 = m2[i].x*a + m2[i].y*b + c;

            a = F[0]*m2[i].x + F[3]*m2[i].y + F[6];
            b = F[1]*m2[i].x + F[4]*m2[i].y + F[7];
            c = F[2]*m2[i].x + F[5]*m2[i].y + F[8];

            s1 = 1./(a*a + b*b);
            d1 = m1[i].x*a + m1[i].y*b + c;

            err[i] = (float)std::max(d1*d1*s1, d2*d2*s2);
        }
    }
