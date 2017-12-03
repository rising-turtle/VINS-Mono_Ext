/*
    Dec. 2 2017, He Zhang, hxzhang1@ualr.edu 

    add keyframe, freak discriptor, add freak match scheme 

*/

#include "freak_tracker.h"
#include "keyframe.h"

CFreakTracker::CFreakTracker(){}
CFreakTracker::~CFreakTracker(){}

// if >70% features are tracked, no need 
bool CFreakTracker::needNewKeyFrame()
{
    
}

CKeyFrame* CFreakTracker::createNewKeyFrame()
{
    CKeyFrame* pkf = new CKeyFrame(); 
    int N_tracked = forw_pts.size(); 
    pkf->mImg = forw_img; 
    // pkf->mvKPts = forw_pts;
    pkf->mIds = ids; 
    int N_new_added = n_pts.size(); 
    pkf->mvKPts.resize(N_tracked + N_new_added); 
    pkf->mIds.resize(N_tracked + N_new_added); 

    for(int i=0; i<N_tracked; i++)
    {
	cv::KeyPoint& kp = pkf->mvKPts[i]; 
	kp.size = FEATURE_SIZE;
	kp.pt = forw_pts[i]; 
    }

    for(int j=0; j<N_new_added; j++)
    {
	cv::KeyPoint& kp = pkf->mvKPts[N_tracked + j]; 
	kp.size = FEATURE_SIZE; 
	kp.pt = n_pts[j]; 
	pkf->mIds[N_tracked + j] = -1; 
    }

    // 

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
	    ROS_DEBUG("describe freak begins"); 
	    TicToc t_d; 
	    pKF->describe(); 
	    ROS_DEBUG("describe freak costs: %fms", t_d.toc()); 
	}
        prev_img = forw_img;
        prev_pts = forw_pts;
    }
    cur_img = forw_img;
    cur_pts = forw_pts;
}
