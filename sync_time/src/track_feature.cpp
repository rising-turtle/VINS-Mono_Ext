/*
    Jan. 10 2018, He Zhang, hxzhang1@ualr.edu 
    continuously extract and track features 
input:
    a sequence of images, 
output:
    extracted feature and tracked information  
*/

#include "track_feature.h"
#include <ros/ros.h>
using namespace camodocal;

namespace
{
    bool inBorder(const cv::Point2f &pt, int ROW, int COL)
    {
	const int BORDER_SIZE = 1;
	int img_x = cvRound(pt.x);
	int img_y = cvRound(pt.y);
	return BORDER_SIZE <= img_x && img_x < COL - BORDER_SIZE && BORDER_SIZE <= img_y && img_y < ROW - BORDER_SIZE;
    }
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
}

int CTrackFeat::sNId = 0; 

CTrackFeat::CTrackFeat(int win_size): 
WINDOW_SIZE(win_size)
{
    initParam(); 
}
CTrackFeat::~CTrackFeat(){}

void CTrackFeat::initParam()
{
    // tune parameters according to camera 
    COL = 640; 
    ROW = 480;
    FOCAL_LENGTH = 460; 
    MIN_DIST = 15; // 30
    F_THRESHOLD = 3.;
    MAX_CNT = 100; // 150
}

void CTrackFeat::readImage(const cv::Mat& _img)
{
    cv::Mat img; 
    cv::Mat gray_img = _img.clone(); 
    {	
	// EQUALIZE 
	if(gray_img.channels()==3)
	{
	    // cvtColor(mImGray,mImGray,CV_RGB2GRAY);
	    cv::cvtColor(gray_img,gray_img,CV_BGR2GRAY);
	}
	else if(gray_img.channels()==4)
	{
	    // cv::cvtColor(mImGray,mImGray,CV_RGBA2GRAY);
	    cv::cvtColor(gray_img,gray_img,CV_BGRA2GRAY);
	}

	cv::Ptr<cv::CLAHE> clahe = cv::createCLAHE(3.0, cv::Size(8,8)); 
	clahe->apply(gray_img, img); 
    }

    if(mPreImg.empty()) // first image
    {
	mPreImg = mCurImg = img; 
    }else
	mCurImg = img; 
    
    mvCurPts.clear(); 
    if(mvPrePts.size() > 0) // track features in the previous image 
    {
	vector<uchar> status; 
	vector<float> err; 
	cv::calcOpticalFlowPyrLK(mPreImg, mCurImg, mvPrePts, mvCurPts, status, err, cv::Size(21, 21), 3); 
	for(int i=0; i<int(mvCurPts.size()); i++)
	{
	    if(status[i] && !inBorder(mvCurPts[i], ROW, COL))
		status[i] = false; 
	}
	reduceVector(mvPrePts, status);
	reduceVector(mvCurPts, status); 
	reduceVector(mvIds, status); 
	reduceVector(mvTrackCnt, status);
    }
    {
	// handle the tracked features 
	rejectWithF(); 
	for(auto &n : mvTrackCnt)
	    ++n;
	
	// set mask
	setMask(); 

	int n_max_cnt = MAX_CNT - static_cast<int>(mvCurPts.size()); 
	if(n_max_cnt > 0)
	{
	    cv::goodFeaturesToTrack(mCurImg, mvNewPts, MAX_CNT - mvCurPts.size(), 0.02, MIN_DIST, mMask); 
	    ROS_DEBUG("track_feature: MAX_CNT - mvCurPts.size() = %d get new %d points", MAX_CNT - mvCurPts.size(), mvNewPts.size());
	}else
	    mvNewPts.clear(); 
    }

    // add new points 
    addPoints(); 
    
    mPreImg = mCurImg;
    mvPrePts = mvCurPts; 
    return ; 
}

void CTrackFeat::addPoints()
{
    for(auto &p: mvNewPts)
    {
	mvCurPts.push_back(p); 
	mvIds.push_back(CTrackFeat::sNId++);
	mvTrackCnt.push_back(1); 
    }
}

void CTrackFeat::rejectWithF()
{
    if (mvCurPts.size() >= 8)
    {
	ROS_DEBUG("FM ransac begins");
	vector<cv::Point2f> un_prev_pts(mvPrePts.size()), un_forw_pts(mvCurPts.size());
	for (unsigned int i = 0; i < mvPrePts.size(); i++)
	{
	    Eigen::Vector3d tmp_p;
	    m_camera->liftProjective(Eigen::Vector2d(mvPrePts[i].x, mvPrePts[i].y), tmp_p);
	    tmp_p.x() = FOCAL_LENGTH * tmp_p.x() / tmp_p.z() + COL / 2.0;
	    tmp_p.y() = FOCAL_LENGTH * tmp_p.y() / tmp_p.z() + ROW / 2.0;
	    un_prev_pts[i] = cv::Point2f(tmp_p.x(), tmp_p.y());

	    m_camera->liftProjective(Eigen::Vector2d(mvCurPts[i].x, mvCurPts[i].y), tmp_p);
	    tmp_p.x() = FOCAL_LENGTH * tmp_p.x() / tmp_p.z() + COL / 2.0;
	    tmp_p.y() = FOCAL_LENGTH * tmp_p.y() / tmp_p.z() + ROW / 2.0;
	    un_forw_pts[i] = cv::Point2f(tmp_p.x(), tmp_p.y());
	}

	vector<uchar> status;
	cv::findFundamentalMat(un_prev_pts, un_forw_pts, cv::FM_RANSAC, F_THRESHOLD, 0.99, status);
	int size_a = mvPrePts.size();
	reduceVector(mvPrePts, status);
	reduceVector(mvCurPts, status);
	reduceVector(mvIds, status);
	reduceVector(mvTrackCnt, status);
	ROS_DEBUG("FM ransac: %d -> %lu: %f", size_a, mvCurPts.size(), 1.0 * mvCurPts.size() / size_a);
    }
    return ; 
}

void CTrackFeat::setMask()
{
    mMask = cv::Mat(ROW, COL, CV_8UC1, cv::Scalar(255)); 
    
    // prefer to keep features that are tracked for long time
    vector<pair<int, pair<cv::Point2f, int>>> cnt_pts_id;

    for (unsigned int i = 0; i < mvCurPts.size(); i++)
	cnt_pts_id.push_back(make_pair(mvTrackCnt[i], make_pair(mvCurPts[i], mvIds[i])));

    sort(cnt_pts_id.begin(), cnt_pts_id.end(), [](const pair<int, pair<cv::Point2f, int>> &a, const pair<int, pair<cv::Point2f, int>> &b)
	    {
	    return a.first > b.first;
	    });

    mvCurPts.clear();
    mvIds.clear();
    mvTrackCnt.clear();

    for (auto &it : cnt_pts_id)
    {
	if (mMask.at<uchar>(it.second.first) == 255)
	{
	    mvCurPts.push_back(it.second.first);
	    mvIds.push_back(it.second.second);
	    mvTrackCnt.push_back(it.first);
	    cv::circle(mMask, it.second.first, MIN_DIST, 0, -1);
	}
    }
    return ;
}
vector<cv::Point2f> CTrackFeat::undistortedPoints()
{
    vector<cv::Point2f> un_pts;
    //cv::undistortPoints(cur_pts, un_pts, K, cv::Mat());
    for (unsigned int i = 0; i < mvCurPts.size(); i++)
    {
        Eigen::Vector2d a(mvCurPts[i].x, mvCurPts[i].y);
        Eigen::Vector3d b;
        m_camera->liftProjective(a, b);
        un_pts.push_back(cv::Point2f(b.x() / b.z(), b.y() / b.z()));
    }

    return un_pts;
}

cv::Mat CTrackFeat::showTrack()
{
    cv::Mat tmp_img = mCurImg.clone(); 
    cv::cvtColor(tmp_img, tmp_img, CV_GRAY2BGR); 
    for(unsigned j =0; j<mvCurPts.size(); j++)
    {
	double len = std::min(1.0, 1.0 * mvTrackCnt[j]/WINDOW_SIZE); 
	cv::circle(tmp_img, mvCurPts[j], 2, cv::Scalar(255*(1-len), 0, 255 * len), 2);
    }
    return tmp_img;
}

void CTrackFeat::readCamIntrinsicParam(const string calib_f)
{
    ROS_DEBUG("track_feature: read CamIntrinsicParam %s: ", calib_f.c_str()); 
    m_camera = CameraFactory::instance()->generateCameraFromYamlFile(calib_f);
}


