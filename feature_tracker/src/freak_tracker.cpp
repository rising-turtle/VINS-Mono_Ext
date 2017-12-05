/*
    Dec. 2 2017, He Zhang, hxzhang1@ualr.edu 

    add keyframe, freak discriptor, add freak match scheme 

*/

#include "freak_tracker.h"
#include "keyframe.h"
#include <opencv2/legacy/legacy.hpp>

using namespace std;
using cv::Point2f; 
using cv::Mat;
using cv::KeyPoint; 
using cv::DMatch; 

CFreakTracker::CFreakTracker(){}
CFreakTracker::~CFreakTracker(){}

// if >70% features are tracked, no need 
bool CFreakTracker::needNewKeyFrame()
{
    return false;
}

void CFreakTracker::matchNewKeyFrame(CKeyFrame* pold, CKeyFrame* pnew)
{
    vector<cv::DMatch> matches; 
    if(pnew->mUnTracked < LEAST_NUM_FOR_PNP) 
	return ; 
    cv::Mat descOld = pold->mDiscriptor.clone(); 
    cv::Mat descNew = pnew->mDiscriptor.clone(); 

    // extract features from new keyframe that have not been matched 
    vector<int> nIdMap; 
    nIdMap.resize(pnew->mIds.size()); 
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
    cv::resize(descNew, descNew, cv::Size(k, descNew.cols)); // resize to k row 
    
    // extract features from old keyframe that have not been tracked in new keyframe 
    vector<int> oIdMap;
    oIdMap.resize(pold->mIds.size()); 
    vector<Point2f> old_pts; 
    old_pts.resize(pold->mIds.size()); 
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
    if(k < LEAST_NUM_FOR_PNP) return ; 
    
    oIdMap.resize(k); 
    old_pts.resize(k); 
    cv::resize(descOld, descOld, cv::Size(k, descOld.cols)); // 
    
    // match the unmatched features 
    vector<DMatch> new_matches; 
    if(v_tracked.size() >= TRACKED_ENOUGH_FEATURE) // 
    {
	new_matches = findMatchByTracked(pold, pnew, v_tracked, old_pts, descOld, new_pts, descNew); 
    }else{
	new_matches = findMatchByPnP(old_pts, descOld, new_pts, descNew); 
    }
    
    // update newKeyFrame 
    for(int i=0; i<new_matches.size(); i++)
    {
	DMatch& m = new_matches[i]; 
	assert(pnew->mIds[nIdMap[m.queryIdx]] == -1);
	assert(pold->mIds[oIdMap[m.trainIdx]] != -1); 
	pnew->mIds[nIdMap[m.queryIdx]] = pold->mIds[oIdMap[m.trainIdx]]; 
	pnew->mUnTracked--;
    }
    return ;
}

std::vector<cv::DMatch> CFreakTracker::findMatchByTracked(CKeyFrame * pold, CKeyFrame* pnew, vector<cv::DMatch>& m_tracked,
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
}

std::vector<cv::DMatch> CFreakTracker::matchDesc(Mat& train_desc, Mat& query_desc)
{
    vector<DMatch> matches; 
#if CV_SSSE3
    cv::BruteForceMatcher< cv::HammingSeg<30,4> > matcher;
#else
    cv::BruteForceMatcher<cv::Hamming> matcher;
#endif
    matcher.match(train_desc, query_desc, matches); 
    return matches; 
}

std::vector<cv::DMatch> CFreakTracker::findMatchByPnP(vector<Point2f>& old_pts, Mat& old_desc, 
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
}

void CFreakTracker::checkNewPoints()
{
    if(mpLastKF == 0) return; 

    // 1. find out F model
    vector<KeyPoint> pre_un_pts; 
    pre_un_pts.reserve(mpLastKF->mIds.size()); 
    vector<int> oIdMap(mpLastKF->mIds.size()); 
    cv::Mat oDesc = mpLastKF->mDiscriptor.clone(); 
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
	    oDesc.row(k) = mpLastKF->mDiscriptor.row(j); 
	    oIdMap[k++] = j; 
	}
    }
    cv::resize(oDesc, oDesc, cv::Size(k, oDesc.cols)); 
    oIdMap.resize(k); 
    if(pre_pts.size() < 8) 
    {
	ROS_ERROR("freak_tracked.cpp: impossible pre_pts.size() = %d", pre_pts.size()); 
	return; 
    }
    cv::Mat F_model = cv::findFundamentalMat(pre_pts, cur_pts, cv::FM_8POINT); 

    // 2. describe new points 
    vector<KeyPoint> cur_un_pts(n_pts.size()); 
    int N_untracked = n_pts.size(); 
    int N_tracked = forw_pts.size() - N_untracked; 
    vector<int>	new_ids(N_untracked, -1); 

    for(int i=0; i<cur_un_pts.size(); i++)
    {
	KeyPoint& kp = cur_un_pts[i]; 
	kp.pt = n_pts[i]; 
	kp.size = FEATURE_SIZE; 
    }   
    cv::Mat nDesc; 
    ((CKeyFrame*)0)->describe(forw_img, cur_un_pts, nDesc); 
    // 3. match 
    vector<DMatch> matches = matchDesc(oDesc, nDesc); 
    // 4. check out whether the matched features satisfy F_model 
    vector<Point2f> tmp_old_pts(matches.size()); 
    vector<Point2f> tmp_new_pts(matches.size()); 
    for(int i=0; i<matches.size(); i++)
    {
	tmp_old_pts[i] = pre_un_pts[matches[i].trainIdx].pt; 
	tmp_new_pts[i] = cur_un_pts[matches[i].queryIdx].pt; 
    }
    vector<float> err;
    computeError(tmp_old_pts, tmp_new_pts, F_model, err); 
    for(int i=0; i<err.size(); i++)
    {
	if(err[i] <= F_THRESHOLD) // this feature satisfy the F model
	{
	    ids[N_tracked+matches[i].queryIdx] = mpLastKF->mIds[oIdMap[matches[i].trainIdx]]; 
	}
    }
    return ; 
}

void CFreakTracker::addKeyFrame(CKeyFrame* pkf)
{
    
}


CKeyFrame* CFreakTracker::createNewKeyFrame()
{
    CKeyFrame* pkf = new CKeyFrame(); 
    int N = forw_pts.size(); 
    pkf->mImg = forw_img; 
    // pkf->mvKPts = forw_pts;
    pkf->mIds = ids; 
    int N_new_added = n_pts.size(); 
    pkf->mvKPts.resize(N); 
    pkf->mIds.resize(N); 

    for(int i=0; i<N; i++)
    {
	cv::KeyPoint& kp = pkf->mvKPts[i]; 
	kp.size = FEATURE_SIZE;
	kp.pt = forw_pts[i]; 
	pkf->mIds[i] = ids[i]; 
    }
    pkf->mUnTracked = N_new_added; 

    // describe feature with freak 
    ROS_DEBUG("describe freak begins"); 
    TicToc t_d; 
    pkf->describe(); 
    ROS_DEBUG("describe freak costs: %fms", t_d.toc()); 

    return pkf; 
}	

void CFreakTracker::readImage(const cv::Mat &_img)
{
    cv::Mat img;
    TicToc t_r;

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

    if (PUB_THIS_FRAME)
    {
        rejectWithF();

        for (auto &n : track_cnt)
            n++;

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
	    CKeyFrame * pKF = createNewKeyFrame();
	    addKeyFrame(pKF); 
	}else{
	    checkNewPoints(); 
	}
	
        prev_img = forw_img;
        prev_pts = forw_pts;
    }
    cur_img = forw_img;
    cur_pts = forw_pts;
}

 void CFreakTracker::computeError( cv::InputArray _m1, cv::InputArray _m2, cv::InputArray _model, cv::OutputArray _err ) 
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
