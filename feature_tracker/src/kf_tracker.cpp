/*
    Dec. 2 2017, He Zhang, hxzhang1@ualr.edu 

    add keyframe, freak discriptor, add freak match scheme 

*/

// #include "kf_tracker.h"
#include "kf_tracker.h"
#include "keyframe.h"
// #include <opencv2/legacy/legacy.hpp>

using namespace std;
using cv::Point2f; 
using cv::Mat;
using cv::KeyPoint; 
using cv::DMatch; 

// make it static, shared by all KFTracker instances
vector<int> KFTracker::gvIdTNum;

KFTracker::KFTracker(): 
mpLastKF(0),
mFrameCnt(0)
{}
KFTracker::~KFTracker()
{
	while(!noKeyFrame())
		removeOldKeyFrame();
	mpLastKF = 0;
}

// if >50% features are tracked, no need 
bool KFTracker::needNewKeyFrame()
{
    if(mpLastKF == 0) return true; 
    int N_matched = 0; 
    for(int i=0; i<mpLastKF->mIds.size(); i++)
    {
	int id = mpLastKF->mIds[i]; 
	for(int j=0; j<ids.size(); j++)
	{
	    if(ids[j] == -1) break; 
	    if(ids[j] == id) 
	    {
		N_matched++;
		break; 
	    }
	}
    }

    double ratio = (double)N_matched/(double)mpLastKF->mvKPts.size(); 

    if(ratio >= NEW_KF_THRESHOLD) return false; 
    return true;
}

int KFTracker::matchNewKeyFrame(CKeyFrame* pold, CKeyFrame* pnew)
{
    vector<cv::DMatch> matches; 
    if(pnew->mUnTracked < LEAST_NUM_FOR_PNP) 
	return 0; 
    // check out how many features are already matched 
    vector<cv::DMatch> v_tracked; 
    v_tracked.reserve(pold->mIds.size());
    vector<bool> old_matched(pold->mIds.size(), 0); 
    vector<bool> new_matched(pnew->mIds.size(), 0);
	
    for(int i=0; i<pold->mIds.size(); i++)
    {
	int id = pold->mIds[i];
	bool tracked = false; 
	assert(id != -1); 
	for(int j=0; j<pnew->mIds.size(); j++)
	{
	    if(pnew->mIds[j] == id)
	    {
		tracked = true; 
		cv::DMatch m; 
		m.trainIdx = i; 
		m.queryIdx = j; 
		v_tracked.push_back(m);
		old_matched[i] = 1; 
		new_matched[j] = 1;
		break;
	    }
	}
    }
    
    // match the unmatched features 
    vector<DMatch> new_matches; 
    if(v_tracked.size() >= TRACKED_ENOUGH_FEATURE) // 
    {
       ROS_DEBUG("findMatchByTracked"); 
	TicToc t_fmbt;
	new_matches = findMatchByTracked(pold, pnew, v_tracked, old_matched); 
	ROS_DEBUG("findMatchByTracked cost %f ms, find %d new_matches", t_fmbt.toc(), new_matches.size()); 
    }else{
       ROS_DEBUG("findMatchByPnP"); 
	TicToc t_fmpp;
	// new_matches = findMatchByPnP(pold, pnew, old_matched, new_matched); 
	ROS_DEBUG("findMatchByPnP cost %f ms, find %d new_matches", t_fmpp.toc(), new_matches.size());
    }
    
    // update newKeyFrame 
    int ret = 0;
    for(int i=0; i<new_matches.size(); i++)
    {
	DMatch& m = new_matches[i]; 
	// assert(m.trainIdx < pold->mIds.size()); 
	// assert(m.queryIdx < pnew->mIds.size());
	// assert(pnew->mIds[m.queryIdx] == -1);
	// assert(pold->mIds[m.trainIdx] != -1); 
	
	if(pnew->mIds[m.queryIdx] == -1)
	{
		pnew->mIds[m.queryIdx] = pold->mIds[m.trainIdx]; 
		pnew->mUnTracked--;
		ret++;
	}else{
		int id1 = pold->mIds[m.trainIdx]; 
		int id2 = pnew->mIds[m.queryIdx];
		if(KFTracker::gvIdTNum[id1] > KFTracker::gvIdTNum[id2] || 
			(KFTracker::gvIdTNum[id1] == KFTracker::gvIdTNum[id2] && id1 < id2)) // id1 is more accountable 
		{
			// assert(m.queryIdx < ids.size());
			pnew->mIds[m.queryIdx] = pold->mIds[m.trainIdx]; 
			ids[m.queryIdx] = id1; 
			ret++;
		} 
	}
    }
    
    return ret;
}

/*
int KFTracker::matchNewKeyFrame(CKeyFrame* pold, CKeyFrame* pnew)
{
    vector<cv::DMatch> matches; 
    if(pnew->mUnTracked < LEAST_NUM_FOR_PNP) 
	return 0; 
    cv::Mat descOld = pold->mDiscriptor.clone(); 
    cv::Mat descNew = pnew->mDiscriptor.clone(); 

    // extract features from new keyframe that have not been matched 
    vector<int> nIdMap(pnew->mIds.size()); 
    vector<Point2f> new_pts(pnew->mIds.size());
    int k = 0;
    for(int i=0; i<pnew->mIds.size(); i++)
    {
	if(pnew->mIds[i] == -1) // unmatched feature
	{
	    descNew.row(k) = pnew->mDiscriptor.row(i); 
	    new_pts[k] = pnew->mvKPts[i].pt; 
	    nIdMap[k++] = i; 
	}
    }
    new_pts.resize(k); 
    nIdMap.resize(k); 
    cv::resize(descNew, descNew, cv::Size(descNew.cols, k)); // resize to k row, cv::Size(width, height) 
    
    // extract features from old keyframe that have not been tracked in new keyframe 
    vector<int> oIdMap(pold->mIds.size());
    vector<Point2f> old_pts(pold->mIds.size()); 
    k = 0;
    vector<cv::DMatch> v_tracked; 
    v_tracked.reserve(pold->mIds.size());
    for(int i=0; i<pold->mIds.size(); i++)
    {
	int id = pold->mIds[i];
	bool tracked = false; 
	assert(id != -1); 
	for(int j=0; j<pnew->mIds.size(); j++)
	{
	    if(pnew->mIds[j] == id)
	    {
		tracked = true; 
		cv::DMatch m; 
		m.trainIdx = i; 
		m.queryIdx = j; 
		v_tracked.push_back(m); 
		break;
	    }
	}
	if(!tracked) // not been tracked 
	{
	    descOld.row(k) = pold->mDiscriptor.row(i); 
	    old_pts[k] = pold->mvKPts[i].pt; 
	    oIdMap[k++] = i; 
	}else{ // tracked, or already matched features
	    // cnt_tracked++; 
	}
    }
    if(k < LEAST_NUM_FOR_PNP) return 0; 
    
    oIdMap.resize(k); 
    old_pts.resize(k); 
    cv::resize(descOld, descOld, cv::Size(descOld.cols, k )); // cv::Size(width, height)
    
    // match the unmatched features 
    vector<DMatch> new_matches; 
    if(v_tracked.size() >= TRACKED_ENOUGH_FEATURE) // 
    {
       ROS_DEBUG("findMatchByTracked"); 
	TicToc t_fmbt;
	new_matches = findMatchByTracked(pold, pnew, v_tracked, old_pts, descOld, new_pts, descNew); 
	ROS_DEBUG("findMatchByTracked cost %f ms, find %d new_matches", t_fmbt.toc(), new_matches.size()); 
    }else{
       ROS_DEBUG("findMatchByPnP"); 
	TicToc t_fmpp;
	new_matches = findMatchByPnP(old_pts, descOld, new_pts, descNew); 
	ROS_DEBUG("findMatchByPnP cost %f ms, find %d new_matches", t_fmpp.toc(), new_matches.size());
    }
    
    // update newKeyFrame 
    int ret = 0;
    for(int i=0; i<new_matches.size(); i++)
    {
	DMatch& m = new_matches[i]; 
	assert(pnew->mIds[nIdMap[m.queryIdx]] == -1);
	assert(pold->mIds[oIdMap[m.trainIdx]] != -1); 
	pnew->mIds[nIdMap[m.queryIdx]] = pold->mIds[oIdMap[m.trainIdx]]; 
	pnew->mUnTracked--;
	ret++;
    }
    return ret;
}*/

std::vector<cv::DMatch> KFTracker::findMatchByTracked(CKeyFrame * pold, CKeyFrame* pnew, vector<cv::DMatch>& m_tracked,
						    vector<bool>& old_matched)
{
    vector<DMatch> ret;
    // compute F matrix given tracked features  
    vector<Point2f> ot_pts, nt_pts;
    ot_pts.resize(m_tracked.size()); 
    nt_pts.resize(m_tracked.size()); 
    for(int i=0; i<m_tracked.size(); i++)
    {
	DMatch& m = m_tracked[i]; 
	Vector3d tmpp; 
	ot_pts[i] = pold->mvKPts[m.trainIdx].pt; 
	m_camera->liftProjective(Eigen::Vector2d(ot_pts[i].x, ot_pts[i].y), tmpp);
	if(tmpp(0) != tmpp(0))
	{
		Eigen::Vector3d tmp; 
		if(liftPixel(Eigen::Vector2d(ot_pts[i].x, ot_pts[i].y), tmp))
			tmpp = tmp;
	}
	ot_pts[i].x = FOCAL_LENGTH * tmpp.x() / tmpp.z() + COL/2.0; 
	ot_pts[i].y = FOCAL_LENGTH * tmpp.y() / tmpp.z() + ROW/2.0; 

	nt_pts[i] = pnew->mvKPts[m.queryIdx].pt; 
	m_camera->liftProjective(Eigen::Vector2d(nt_pts[i].x, nt_pts[i].y), tmpp);
	if(tmpp(0) != tmpp(0))
	{
		Eigen::Vector3d tmp; 
		if(liftPixel(Eigen::Vector2d(nt_pts[i].x, nt_pts[i].y), tmp))
			tmpp = tmp;
	}
	nt_pts[i].x = FOCAL_LENGTH * tmpp.x() / tmpp.z() + COL/2.0; 
	nt_pts[i].y = FOCAL_LENGTH * tmpp.y() / tmpp.z() + ROW/2.0; 
    }
    // Mat F_model = cv::findFundamentalMat(ot_pts, nt_pts, cv::FM_8POINT); 
    vector<uchar> status;
   cv::Mat F_model = cv::findFundamentalMat(ot_pts, nt_pts, cv::FM_RANSAC, F_THRESHOLD, 0.99, status); 
   
    // compute search radius 
    float l = maxDisparity(ot_pts, nt_pts); 
    l *= 1.5; 
    float l_sqr = l * l;
	
    // collect points have not been matched in pold and pnew 
    int N = pold->mIds.size(); 
    vector<Point2f> old_pts(N);
    vector<int> oIdMap(N);
    int k = 0; 
    for(int i=0; i<N; i++)
    {
	if(old_matched[i] == false)
	{
		old_pts[k] = pold->mvKPts[i].pt; 
		oIdMap[k++] = i;
	}
    }
    old_pts.resize(k); 
    oIdMap.resize(k); 

    // collect points have not been matched in pold and pnew 
    N = pnew->mIds.size();
    vector<Point2f> new_pts(N);
    vector<int> nIdMap(N); 
    k = 0;
    for(int i=0; i<N; i++)
    {
	if(pnew->mIds[i] == -1)
	{
		new_pts[k] = pnew->mvKPts[i].pt; 
		nIdMap[k++] = i;
	}
    }
    new_pts.resize(k); 
    nIdMap.resize(k);

    const double* F = F_model.ptr<double>();

    // undistortion 
   for(int i=0; i<old_pts.size(); i++)
   {
	Eigen::Vector3d tmpp; 
	m_camera->liftProjective(Eigen::Vector2d(old_pts[i].x, old_pts[i].y), tmpp); 
	if(tmpp(0) != tmpp(0))
	{
		Eigen::Vector3d tmp; 
		if(liftPixel(Eigen::Vector2d(old_pts[i].x, old_pts[i].y), tmp))
			tmpp = tmp;
	}
	old_pts[i].x = FOCAL_LENGTH * tmpp.x() / tmpp.z() + COL/2.0; 
	old_pts[i].y = FOCAL_LENGTH * tmpp.y() / tmpp.z() + ROW/2.0; 
   }
	 
   for(int i=0; i<new_pts.size(); i++)
   {
	Eigen::Vector3d tmpp; 
	m_camera->liftProjective(Eigen::Vector2d(new_pts[i].x, new_pts[i].y), tmpp); 
	if(tmpp(0) != tmpp(0))
	{
		Eigen::Vector3d tmp; 
		if(liftPixel(Eigen::Vector2d(new_pts[i].x, new_pts[i].y), tmp))
			tmpp = tmp;
	}
	new_pts[i].x = FOCAL_LENGTH * tmpp.x() / tmpp.z() + COL/2.0; 
	new_pts[i].y = FOCAL_LENGTH * tmpp.y() / tmpp.z() + ROW/2.0; 
   }

    // search for matched points 
    for(int i=0; i<new_pts.size(); i++)
    {
	Point2f& p1 = new_pts[i];
	if(p1.x != p1.x || p1.y != p1.y) // skip nan pt 
		continue; 
	for(int j=0; j<old_pts.size(); j++)
	{
		Point2f& p2 = old_pts[j];
		if(p2.x != p2.x || p2.y != p2.y)
			continue;
		float sqr_dis = (p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y); 
		if(sqr_dis > l_sqr) // outside search radius 
			continue; 

		// within search radius, check distance to epipolar line given model F 
		double a, b, c, d1, d2, s1, s2;

            a = F[0]*p2.x + F[1]*p2.y + F[2];
            b = F[3]*p2.x + F[4]*p2.y + F[5];
            c = F[6]*p2.x + F[7]*p2.y + F[8];

            s2 = 1./(a*a + b*b);
            d2 = p1.x*a + p1.y*b + c;

            a = F[0]*p1.x + F[3]*p1.y + F[6];
            b = F[1]*p1.x + F[4]*p1.y + F[7];
            c = F[2]*p1.x + F[5]*p1.y + F[8];

            s1 = 1./(a*a + b*b);
            d1 = p2.x*a +p2.y*b + c;

            float err = (float)std::max(d1*d1*s1, d2*d2*s2);
	     if(err <= F_THRESHOLD/2.) // find a good match
	     // if(err <= 1.0)
	     {
	     		DMatch m;
			m.queryIdx = nIdMap[i]; 
			m.trainIdx = oIdMap[j];
			ret.push_back(m);
			break;
	     }
	}

    }
    return ret; 
}

/*
std::vector<cv::DMatch> KFTracker::findMatchByTracked(CKeyFrame * pold, CKeyFrame* pnew, vector<cv::DMatch>& m_tracked,
						    vector<Point2f>& old_pts, Mat& old_desc, 
						    vector<Point2f>& new_pts, Mat& new_desc)
{
    vector<DMatch> ret;
    // compute F matrix given tracked features  
    vector<Point2f> ot_pts, nt_pts;
    ot_pts.resize(m_tracked.size()); 
    nt_pts.resize(m_tracked.size()); 
    for(int i=0; i<m_tracked.size(); i++)
    {
	DMatch& m = m_tracked[i]; 
	ot_pts[i] = pold->mvKPts[m.trainIdx].pt; 
	nt_pts[i] = pnew->mvKPts[m.queryIdx].pt; 
    }
    Mat F_model = cv::findFundamentalMat(ot_pts, nt_pts, cv::FM_8POINT); 
    // check out the errros given F matrix 
    vector<DMatch> matches = matchDesc(old_desc, new_desc); 
    ret.reserve(matches.size()); 
    vector<Point2f> tmp_old_pts(matches.size()); 
    vector<Point2f> tmp_new_pts(matches.size()); 
    for(int i=0; i<matches.size(); i++)
    {
	tmp_old_pts[i] = old_pts[matches[i].trainIdx]; 
	tmp_new_pts[i] = new_pts[matches[i].queryIdx]; 
    }
    vector<float> err;
    computeError(tmp_old_pts, tmp_new_pts, F_model, err); 
    for(int i=0; i<err.size(); i++)
    {
	if(err[i] <= F_THRESHOLD) // this feature satisfy the F model
	   ret.push_back(matches[i]); 
    }
    return ret; 
}*/
/*
std::vector<cv::DMatch> KFTracker::matchDesc(Mat& train_desc, Mat& query_desc)
{
    vector<DMatch> matches; 
#if CV_SSSE3
    cv::BruteForceMatcher< cv::HammingSeg<30,4> > matcher;
#else
    cv::BruteForceMatcher<cv::Hamming> matcher;
#endif
    matcher.match(query_desc, train_desc, matches); // bug: match (query, train, matches)
    return matches; 
}*/
/*
std::vector<cv::DMatch> KFTracker::findMatchByPnP(CKeyFrame * pold, CKeyFrame* pnew, 
						    vector<bool>& old_matched, vector<bool>& new_matched)
{
    vector<DMatch> ret;
    pnew->describe(); 
    int N = pnew->mDes2Id.size(); 
    vector<int> nIdMap(N); 
    int k =0; 
    // ROS_WARN("start extract new features");
    // find out points not been matched in new KF 
    for(int i=0; i<N; i++)
    {
	if(new_matched[pnew->mDes2Id[i]] == false)
		nIdMap[k++] = i;
	
    }
    if( k < LEAST_NUM_FOR_PNP) return ret; 
    nIdMap.resize(k); 

    cv::Mat nDesc = pnew->mDiscriptor.clone(); 
    vector<Point2f> new_pts(k); 
    for(int i=0; i<k; i++)
    {
    	// assert(nIdMap[i] < pnew->mDiscriptor.rows);
	// assert(nIdMap[i]  >= 0);
	// assert(i < nDesc.rows);
	nDesc.row(i) = pnew->mDiscriptor.row(nIdMap[i]);
	new_pts[i] = pnew->mvKPts[pnew->mDes2Id[nIdMap[i]]].pt;
    }
    cv::resize(nDesc, nDesc, cv::Size(nDesc.cols, k)); // cv::Size(Width, Height)
    // ROS_WARN("finish extract new features k = %d", k);

    // find out points not been matched in old KF 
    pold->describe();
    // ROS_WARN("start extract old features");
    N = pold->mDes2Id.size(); 
    vector<int> oIdMap(N);
    k = 0 ; 
    for(int i=0; i<N; i++)
    {
	if(old_matched[pold->mDes2Id[i]] == false)
		oIdMap[k++] = i;
    }
    if(k < LEAST_NUM_FOR_PNP) return ret; 
    oIdMap.resize(k);  
    
    cv::Mat oDesc = pold->mDiscriptor.clone(); 
    vector<Point2f> old_pts(k); 
    for(int i=0; i<k; i++)
    {
       // assert(oIdMap[i] < pold->mDiscriptor.rows);
	// assert(oIdMap[i]  >= 0);
	// assert(i < oDesc.rows);
	oDesc.row(i) = pold->mDiscriptor.row(oIdMap[i]);
	old_pts[i] = pold->mvKPts[pold->mDes2Id[oIdMap[i]]].pt;
    }
    // ROS_WARN("finish extract old features k = %d", k);
    cv::resize(oDesc, oDesc, cv::Size(oDesc.cols, k)); // cv::Size(Width, Height)
    
    // ROS_WARN("start to match!");
    // match 
    vector<DMatch> matches = matchDesc(oDesc, nDesc); 
    if(matches.size() < LEAST_NUM_FOR_PNP) return ret; 
    // ROS_WARN("after match, has %d matched features, oDesc has %d nDesc has %d", matches.size(), oDesc.rows, nDesc.rows);
    vector<Point2f> tmp_old_pts(matches.size()); 
    vector<Point2f> tmp_new_pts(matches.size()); 
    vector<int> tmp_map_old(matches.size()); 
    vector<int> tmp_map_new(matches.size());
    for(int i=0; i<matches.size(); i++)
    {
	tmp_old_pts[i] = old_pts[matches[i].trainIdx]; 
	tmp_new_pts[i] = new_pts[matches[i].queryIdx]; 
    }
    // ROS_WARN("finish match, start F_model!");
    vector<uchar> status; 
    // cv::Mat F_model = cv::findFundamentalMat(old_pts, new_pts, cv::FM_RANSAC, F_THRESHOLD, 0.99, status); 
    cv::Mat F_model = cv::findFundamentalMat(tmp_old_pts, tmp_new_pts, cv::FM_RANSAC, F_THRESHOLD, 0.99, status); 
    ret.resize(matches.size()); 
    // ROS_WARN("After F_model");
    k = 0;
    assert(status.size() == matches.size());
    for(int i=0; i<status.size(); i++)
    {
	if(status[i])
	{
	    DMatch m ; 
	    // ROS_INFO(" matches[i].queryIdx  = %d, nIdMap.size() = %d, matches[i].trainIdx = %d, oIdMap.size() = %d, nIdMap[matches[i].queryIdx] = %d, pnew->mDes2Id.size() = %d, oIdMap[matches[i].trainIdx] = %d, pold->mDes2Id.size() = %d", 
		//	matches[i].queryIdx, nIdMap.size(), matches[i].trainIdx, oIdMap.size(), 
		//	nIdMap[matches[i].queryIdx], pnew->mDes2Id.size(), oIdMap[matches[i].trainIdx],  pold->mDes2Id.size());
	    // assert(matches[i].queryIdx < nIdMap.size()); 
	    // assert(matches[i].trainIdx  < oIdMap.size()); 
	    // assert(nIdMap[matches[i].queryIdx] < pnew->mDes2Id.size());
	    // assert(oIdMap[matches[i].trainIdx] < pold->mDes2Id.size());
	    m.queryIdx = pnew->mDes2Id[nIdMap[matches[i].queryIdx]];
	    m.trainIdx = pold->mDes2Id[oIdMap[matches[i].trainIdx]];
	
	    ret[k++] = m; 
	}
    }
    ret.resize(k); 
    // ROS_WARN("Assign return ");
    return ret; 
}
*/
/*
std::vector<cv::DMatch> KFTracker::findMatchByPnP(vector<Point2f>& old_pts, Mat& old_desc, 
						    vector<Point2f>& new_pts, Mat& new_desc)
{
    vector<DMatch> ret;
    vector<DMatch> matches = matchDesc(old_desc, new_desc); 
    if(matches.size() < LEAST_NUM_FOR_PNP) return ret; 
    vector<uchar> status; 
    cv::Mat F_model = cv::findFundamentalMat(old_pts, new_pts, cv::FM_RANSAC, F_THRESHOLD, 0.99, status); 
    ret.resize(matches.size()); 
    int k = 0;
    for(int i=0; i<status.size(); i++)
    {
	if(status[i])
	{
	    ret[k++] = matches[i]; 
	}
    }
    ret.resize(k); 
    return ret; 
}*/


float KFTracker::maxDisparity(vector<Point2f>& pts1, vector<Point2f>& pts2)
{
	assert(pts1.size() == pts2.size()); 
	float l = 0;
	for(int i=0; i<pts1.size(); i++)
	{
		Point2f& p1 = pts1[i]; 
		Point2f& p2 = pts2[i];

		// get rid of any nan pt
		if(p1.x != p1.x || p1.y != p1.y || p2.x != p2.x || p2.y != p2.y)
			continue; 
		float sqr_dis = (p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y); 
		if(l < sqr_dis) l = sqr_dis; 
	}
	return sqrt(l);
}

// match the newly added feature point with pts in keyframe 
int KFTracker::checkNewPoints()
{
 if(mpLastKF == 0) return 0; 
    if(n_pts.size() < LEAST_NUM_FOR_PNP) return 0; 

    // 1. find out F model
    vector<KeyPoint> pre_un_pts; 
    pre_un_pts.reserve(mpLastKF->mIds.size()); 
    vector<int> oIdMap(mpLastKF->mIds.size()); 
   
    int k = 0; 

    vector<Point2f> pre_pts; 
    vector<Point2f> cur_pts; 
    pre_pts.reserve(mpLastKF->mIds.size()); 
    cur_pts.reserve(forw_pts.size()); 
    // for(int i=0; i<forw_pts.size(); i++)
    for(int j=0; j<mpLastKF->mIds.size(); j++)
    {
	int id = mpLastKF->mIds[j]; 
	assert(id != -1); 
	bool tracked = false;
	// for(int j=0; j<mpLastKF->mIds.size(); j++)
	for(int i=0; i<forw_pts.size(); i++)
	{
	    if(ids[i] == -1) break; 
	    if(ids[i] == id)
	    {
		pre_pts.push_back(mpLastKF->mvKPts[j].pt); 
		cur_pts.push_back(forw_pts[i]);
		tracked = true; 
		break; 
	    }
	}
	// not tracked, prepare for discriptor match 
	if(!tracked)
	{
	    pre_un_pts.push_back(mpLastKF->mvKPts[j]); 
	    oIdMap[k++] = j; 
	}
    }
    // ROS_INFO("find out unmatched %d features ", k);
    oIdMap.resize(k); 
    if(pre_pts.size() < LEAST_NUM_FOR_PNP) 
    {
	ROS_ERROR("freak_tracked.cpp: impossible pre_pts.size() = %d", pre_pts.size()); 
	return 0; 
    }
    // cv::Mat F_model = cv::findFundamentalMat(pre_pts, cur_pts, cv::FM_8POINT);
        vector<uchar> status;
    cv::Mat F_model = cv::findFundamentalMat(pre_pts, cur_pts, cv::FM_RANSAC, F_THRESHOLD, 0.99, status); 
	
    // compute maximum disparity l 
    float l = maxDisparity(pre_pts, cur_pts);
    l *= 1.5; // extend search range by 1.5 
    float sqr_l = l*l; 
    int ret = 0;
    // check out new points within l 
    for(int i=ids.size(); i--; )
    {
	if(ids[i] != -1) break;  // ids: [matched; unmatched]
	Point2f& p1 = forw_pts[i];

	bool good_match = false;
	int j = 0;
	const double* F = F_model.ptr<double>();

	for(; j<k; j++)
	{
		Point2f& p2 = mpLastKF->mvKPts[oIdMap[j]].pt;
		float dis_sqr = (p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y); 
		if(dis_sqr > sqr_l) // outside search radius
			continue; 

		// within search radius, check distance to epipolar line given model F 
		double a, b, c, d1, d2, s1, s2;

            a = F[0]*p2.x + F[1]*p2.y + F[2];
            b = F[3]*p2.x + F[4]*p2.y + F[5];
            c = F[6]*p2.x + F[7]*p2.y + F[8];

            s2 = 1./(a*a + b*b);
            d2 = p1.x*a + p1.y*b + c;

            a = F[0]*p1.x + F[3]*p1.y + F[6];
            b = F[1]*p1.x + F[4]*p1.y + F[7];
            c = F[2]*p1.x + F[5]*p1.y + F[8];

            s1 = 1./(a*a + b*b);
            d1 = p2.x*a +p2.y*b + c;

            float err = (float)std::max(d1*d1*s1, d2*d2*s2);
	     // if(err <= F_THRESHOLD/4.) // find a good match
	     if(err <= 0.5)
	     {
			good_match = true; 
			break;
	     }
	}
	
	if(good_match)
	{
		ids[i] = mpLastKF->mIds[oIdMap[j]];
		track_cnt[i] = ++KFTracker::gvIdTNum[ids[i]];
		++ret;
	}
    }
    if(ret > 0)
		ROS_INFO("kf_tracker: in checkNewPoints add %d unmatched features", ret);
    return ret; 

}

/*
// discards this function, since using spatial search is enough
int KFTracker::checkNewPoints()
{
    if(mpLastKF == 0) return 0; 
    if(n_pts.size() < LEAST_NUM_FOR_PNP) return 0; 

    // 1. find out F model
    vector<KeyPoint> pre_un_pts; 
    pre_un_pts.reserve(mpLastKF->mIds.size()); 
    vector<int> oIdMap(mpLastKF->mIds.size()); 
    cv::Mat oDesc = mpLastKF->mDiscriptor.clone(); 
    ROS_INFO("At first oDesc.cols: %d, mDiscriptor.cols%d ", oDesc.cols, mpLastKF->mDiscriptor.cols);
    int k = 0; 

    vector<Point2f> pre_pts; 
    vector<Point2f> cur_pts; 
    pre_pts.reserve(mpLastKF->mIds.size()); 
    cur_pts.reserve(forw_pts.size()); 
    // for(int i=0; i<forw_pts.size(); i++)
    for(int j=0; j<mpLastKF->mIds.size(); j++)
    {
	int id = mpLastKF->mIds[j]; 
	assert(id != -1); 
	bool tracked = false;
	// for(int j=0; j<mpLastKF->mIds.size(); j++)
	for(int i=0; i<forw_pts.size(); i++)
	{
	    if(ids[i] == -1) break; 
	    if(ids[i] == id)
	    {
		pre_pts.push_back(mpLastKF->mvKPts[j].pt); 
		cur_pts.push_back(forw_pts[i]);
		tracked = true; 
		break; 
	    }
	}
	// not tracked, prepare for discriptor match 
	if(!tracked)
	{
	    pre_un_pts.push_back(mpLastKF->mvKPts[j]); 
	    if(j< 0 || j>=mpLastKF->mDiscriptor.rows)
	    {
		ROS_ERROR("what? j = %d mDiscriptor.rows: %d, mIds.size() : %d mvKPts.size(): %d", j, mpLastKF->mDiscriptor.rows, 
		    mpLastKF->mIds.size(), mpLastKF->mvKPts.size());
	    }
	    oDesc.row(k) = mpLastKF->mDiscriptor.row(j); 
	    oIdMap[k++] = j; 
	}
    }
    ROS_INFO("find out unmatched %d features ", k);
    ROS_INFO("Before resize oDesc.cols: %d ", oDesc.cols);
    cv::resize(oDesc, oDesc, cv::Size(oDesc.cols, k)); 
    ROS_INFO("After resize oDesc.cols: %d ", oDesc.cols);
    oIdMap.resize(k); 
    if(pre_pts.size() < LEAST_NUM_FOR_PNP) 
    {
	ROS_ERROR("freak_tracked.cpp: impossible pre_pts.size() = %d", pre_pts.size()); 
	return 0; 
    }
    cv::Mat F_model = cv::findFundamentalMat(pre_pts, cur_pts, cv::FM_8POINT); 
    ROS_INFO("Finish F Model");

    // 2. describe new points 
    vector<KeyPoint> cur_un_pts(n_pts.size()); 
    int N_untracked = n_pts.size(); 
    int N_tracked = forw_pts.size() - N_untracked; 
    vector<int> new_ids(N_untracked, -1); 

    for(int i=0; i<cur_un_pts.size(); i++)
    {
	KeyPoint& kp = cur_un_pts[i]; 
	kp.pt = n_pts[i]; 
	kp.size = FEATURE_SIZE; 
    }   
    cv::Mat nDesc; 
    ((CKeyFrame*)0)->describe(forw_img, cur_un_pts, nDesc); 
    ROS_INFO("Finish describe %d new features!", cur_un_pts.size()); 
    // 3. match 
    vector<DMatch> matches = matchDesc(oDesc, nDesc); 
    if(matches.size() <= 0) return 0;
    // 4. check out whether the matched features satisfy F_model 
    vector<Point2f> tmp_old_pts(matches.size()); 
    vector<Point2f> tmp_new_pts(matches.size()); 
    for(int i=0; i<matches.size(); i++)
    {
	tmp_old_pts[i] = pre_un_pts[matches[i].trainIdx].pt; 
	tmp_new_pts[i] = cur_un_pts[matches[i].queryIdx].pt; 
    }
    int ret = 0;
    vector<float> err;
    computeError(tmp_old_pts, tmp_new_pts, F_model, err); 
    for(int i=0; i<err.size(); i++)
    {
	if(err[i] <= F_THRESHOLD) // this feature satisfy the F model
	{
	    int matched_id = mpLastKF->mIds[oIdMap[matches[i].trainIdx]];
	    ids[N_tracked+matches[i].queryIdx] = matched_id; 
	    track_cnt[N_tracked+matches[i].queryIdx] = ++KFTracker::gvIdTNum[matched_id];
	    ++ret; 
	}
    }
    return ret; 
}
*/

void KFTracker::addKeyFrame(CKeyFrame* pkf)
{
    deque<CKeyFrame*>::reverse_iterator rit = mqKFs.rbegin(); 
    // bool matched_newKF = false; 
    if(mFrameCnt > 200) // 200 is set to not affect initialization process in estimator
    {
    	while(rit!= mqKFs.rend())
    	{
              ROS_DEBUG("matchNewKeyFrame "); 
	       TicToc t_mkf; 
		int new_matched = matchNewKeyFrame(*rit, pkf); 
		ROS_WARN("matchNewKeyFrame cost %f ms, find %d new matches", t_mkf.toc(), new_matched);
		rit++; 
		// matched_newKF = true; 
    	}
    }
    mqKFs.push_back(pkf); 
    if(mqKFs.size() >= MAX_NUM_KFS) 
    {
	removeOldKeyFrame();
    }
    mpLastKF = pkf; 
    // if(matched_newKF)
    {
		// ROS_WARN("succeed to finish addKeyFrame, return !");
    }
    return ;
}

void KFTracker::removeOldKeyFrame()
{
	if(noKeyFrame())
		return; 
	CKeyFrame * p = mqKFs.front(); 
	mqKFs.pop_front();
	delete p; 
}
bool KFTracker::noKeyFrame()
{
	return (mqKFs.size() == 0); 
}

bool KFTracker::updateIDWithKF(int i)
{
    if (i < ids.size())
    {
        if (ids[i] == -1)
	{
	     if(mbNewKF) // a new KF has been created 
	     {
	     	if(mpLastKF->mIds[i] != -1) // this new point has been matched with previous ones
		{
			ids[i] = mpLastKF->mIds[i];
			track_cnt[i] = KFTracker::gvIdTNum[ids[i]];
	     	}else // this point is a new feature point
	     	{
			ids[i] = n_id++;
	    	       KFTracker::gvIdTNum.push_back(1);
			mpLastKF->mIds[i] = ids[i];
		}
	     }else // no new KF
	     {
			ids[i] = n_id++; // assign a new id
			KFTracker::gvIdTNum.push_back(1);
	     }
        }
        return true;
    }
    else
        return false;
}

CKeyFrame* KFTracker::createNewKeyFrame()
{
    CKeyFrame* pkf = new CKeyFrame(); 
    int N = forw_pts.size(); 
    int N_new_added = n_pts.size(); 
    pkf->mvKPts.resize(N); 
    pkf->mImg = forw_img; 
    // pkf->mvKPts = forw_pts;
    pkf->mIds = ids; 

    for(int i=0; i<N; i++)
    {
	cv::KeyPoint& kp = pkf->mvKPts[i]; 
	kp.size = FEATURE_SIZE;
	kp.pt = forw_pts[i]; 
	pkf->mIds[i] = ids[i]; 
    }
    pkf->mUnTracked = N_new_added; 
    // ROS_WARN("N = %d, N_new_added = %d", N, N_new_added);
    // ROS_WARN("new pkf has id: %d kpts: %d discriptors: %d", pkf->mIds.size(), pkf->mvKPts.size(), pkf->mDiscriptor.rows);
    // describe feature with freak 
    // ROS_DEBUG("describe freak begins"); 
    // TicToc t_d; 
    // pkf->describe(); 
    // ROS_DEBUG("describe freak costs: %fms for %d freak features", t_d.toc(), N); 
    // ROS_WARN("new pkf has id: %d kpts: %d discriptors: %d", pkf->mIds.size(), pkf->mvKPts.size(), pkf->mDiscriptor.rows);

    return pkf; 
}	

void KFTracker::readImage(const cv::Mat &_img)
{
    ROS_WARN_ONCE("kf_tracker: in readImage!");
    cv::Mat img;
    TicToc t_r;
    ++mFrameCnt;

    if (EQUALIZE)
    {
        cv::Ptr<cv::CLAHE> clahe = cv::createCLAHE(3.0, cv::Size(8, 8));
        TicToc t_c;
        clahe->apply(_img, img);
        ROS_DEBUG("CLAHE costs: %fms", t_c.toc());
    }
    else
        img = _img;

    if (forw_img.empty())
    {
        prev_img = cur_img = forw_img = img;
    }
    else
    {
        forw_img = img;
    }

    forw_pts.clear();

    if (cur_pts.size() > 0)
    {
        TicToc t_o;
        vector<uchar> status;
        vector<float> err;
        cv::calcOpticalFlowPyrLK(cur_img, forw_img, cur_pts, forw_pts, status, err, cv::Size(21, 21), 3);

        for (int i = 0; i < int(forw_pts.size()); i++)
            if (status[i] && !inBorder(forw_pts[i]))
                status[i] = 0;
        reduceVector(prev_pts, status);
        reduceVector(cur_pts, status);
        reduceVector(forw_pts, status);
        reduceVector(ids, status);
        reduceVector(track_cnt, status);
        ROS_DEBUG("temporal optical flow costs: %fms", t_o.toc());
    }

    mbNewKF = false; 
    if (PUB_THIS_FRAME)
    {
        rejectWithF();

        // for (auto &n : track_cnt)
            // n++;
        for(int i=0; i<track_cnt.size(); i++)
	{
		track_cnt[i]++;
		KFTracker::gvIdTNum[ids[i]]++;
	}

        ROS_DEBUG("set mask begins");
        TicToc t_m;
        setMask();
        ROS_DEBUG("set mask costs %fms", t_m.toc());

        ROS_DEBUG("detect feature begins");
        TicToc t_t;
        int n_max_cnt = MAX_CNT - static_cast<int>(forw_pts.size());
        if (n_max_cnt > 0)
        {
            if(mask.empty())
                cout << "mask is empty " << endl;
            if (mask.type() != CV_8UC1)
                cout << "mask type wrong " << endl;
            if (mask.size() != forw_img.size())
                cout << "wrong size " << endl;
            cv::goodFeaturesToTrack(forw_img, n_pts, MAX_CNT - forw_pts.size(), 0.1, MIN_DIST, mask);
        }
        else
            n_pts.clear();
        ROS_DEBUG("detect feature costs: %fms", t_t.toc());
	
        ROS_DEBUG("add feature begins");
        TicToc t_a;
        addPoints();
        ROS_DEBUG("selectFeature costs: %fms", t_a.toc());
	 	
	if(needNewKeyFrame())
	{
	    // construct keyframe add discriptor for the extracted key points 
	    ROS_DEBUG("createNewKeyFrame"); 
	    TicToc t_ckf; 
	    CKeyFrame * pKF = createNewKeyFrame();
	    ROS_DEBUG("createNewKeyFrame cost %f ms", t_ckf.toc()); 

	    ROS_DEBUG("addKeyFrame"); 
	    TicToc t_addkf; 
	    addKeyFrame(pKF);
	    ROS_DEBUG("addKeyFrame cost %f ms", t_addkf.toc()); 
	    mbNewKF = true; 
	}else{
	    ROS_DEBUG("checkNewPoints");
	    TicToc t_cnp;
	    int added = 0; // checkNewPoints(); 
	    ROS_DEBUG("checkNewPoints cost %f ms add %d new matches", t_cnp.toc(), added); 
	}
	
        prev_img = forw_img;
        prev_pts = forw_pts;
    }
    cur_img = forw_img;
    cur_pts = forw_pts;
}

 void KFTracker::computeError( cv::InputArray _m1, cv::InputArray _m2, cv::InputArray _model, cv::OutputArray _err ) 
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
