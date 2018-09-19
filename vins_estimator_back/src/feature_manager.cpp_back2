#include "feature_manager.h"

int FeaturePerId::endFrame()
{
    // return start_frame + feature_per_frame.size() - 1;
    return start_frame + frame_inc_num[feature_per_frame.size()-1];
}

void FeaturePerId::erase_old()
{
    int d = 1; 
    if(frame_inc_num.size() >= 2)
	d = frame_inc_num[1]; 
    int fd = d; 
    frame_inc_num.erase(frame_inc_num.begin()); 
    for(int i=0; i<frame_inc_num.size(); i++)
	frame_inc_num[i] -= d; 
    start_frame = fd - 1;
    return ; 
}

FeatureManager::FeatureManager(Matrix3d _Rs[], Vector3d _Ps[])
    : Rs(_Rs), Ps(_Ps)
{
    for (int i = 0; i < NUM_OF_CAM; i++)
        ric[i].setIdentity();
}

void FeatureManager::setRic(Matrix3d _ric[])
{
    for (int i = 0; i < NUM_OF_CAM; i++)
    {
        ric[i] = _ric[i];
    }
}

void FeatureManager::clearState()
{
    feature.clear();
}

int FeatureManager::getFeatureCount()
{
    int cnt = 0;
    for (auto &it : feature)
    {

        it.used_num = it.feature_per_frame.size();

        if (it.used_num >= 2 && it.start_frame < WINDOW_SIZE - 2)
        {
            cnt++;
        }
    }
    return cnt;
}

double FeatureManager::compensatedParallax3(const FeaturePerId& it_per_id, int frame_li, int frame_ri)
{
    const FeaturePerFrame & frame_i = it_per_id.feature_per_frame[frame_li];
    const FeaturePerFrame & frame_j = it_per_id.feature_per_frame[frame_ri];

    return computeParallax(frame_i, frame_j); 
}


bool FeatureManager::addFeatureCheckParallax(int frame_count, const map<int, vector<pair<int, Vector3d>>> &image)
{
    ROS_DEBUG("input feature: %d", (int)image.size());
    ROS_DEBUG("num of feature: %d", getFeatureCount());
    double parallax_sum = 0;
    int parallax_num = 0;
    last_track_num = 0;
    // int add_new_num = 0; 
    // static int new_sum = 0; 
    // static int num_new_sum = 0;
    for (auto &id_pts : image)
    {
        FeaturePerFrame f_per_fra(id_pts.second[0].second);

        int feature_id = id_pts.first;
        auto it = find_if(feature.begin(), feature.end(), [feature_id](const FeaturePerId &it)
                          {
            return it.feature_id == feature_id;
                          });

        if (it == feature.end())
        {
            // if(f_per_fra.point(0) != f_per_fra.point(0))
	     {
		// cout<<"new feature f_per_fra: id = "<<feature_id<<" pt: "<< f_per_fra.point(0)<<" "<< f_per_fra.point(1)<<endl;
	     }
            feature.push_back(FeaturePerId(feature_id, frame_count));
            feature.back().feature_per_frame.push_back(f_per_fra);
	    feature.back().frame_inc_num.push_back(0); 
		// ++add_new_num;
        }
        else if (it->feature_id == feature_id)
        {
            // if(f_per_fra.point(0) != f_per_fra.point(0))
	     {
		// cout<<"matched feature f_per_fra: id = "<<feature_id<<" pt: "<< f_per_fra.point(0)<<" "<< f_per_fra.point(1)<<endl;
	     }
            it->feature_per_frame.push_back(f_per_fra);
	    it->frame_inc_num.push_back(frame_count - it->start_frame); // record the relative difference of frame number  
            last_track_num++;
        }
    }
    // ROS_WARN("add new feature %d ", add_new_num); 
    // new_sum += add_new_num; 
    // ++num_new_sum; 
    // ROS_WARN("avg add new feature %d", (int)(new_sum / num_new_sum));

    if (frame_count < 2 || last_track_num < 20)
        return true;

    for (auto &it_per_id : feature)
    {
        // if (it_per_id.start_frame <= frame_count - 2 &&
        //    it_per_id.start_frame + int(it_per_id.feature_per_frame.size()) - 1 >= frame_count - 1)
        // {
            // parallax_sum += compensatedParallax2(it_per_id, frame_count);
            // parallax_num++;
        // }
        if(it_per_id.start_frame > frame_count -2)
		continue; 
	 if(it_per_id.frame_inc_num.size() <= 1)
		continue; 
	 if(it_per_id.start_frame + it_per_id.frame_inc_num[it_per_id.frame_inc_num.size()-1] < frame_count - 1)
	 	continue; 
        int li = -1; 
        int ri = -1; 
	 for(int i=it_per_id.feature_per_frame.size()-1; i>=0; i--)
	 {
		if(it_per_id.start_frame + it_per_id.frame_inc_num[i] == frame_count - 2)
			li = i; 
		if(it_per_id.start_frame + it_per_id.frame_inc_num[i] == frame_count -1)
			ri = i;
		if(li != -1 && ri != -1)
			break; 
		if(it_per_id.start_frame + it_per_id.frame_inc_num[i] < frame_count - 2)
			break;
	 }
	 if(li != -1 && ri != -1)
	 {
		parallax_sum += compensatedParallax3(it_per_id, li, ri);
		parallax_num++;
	 }

	/* if(it_per_id.start_frame <= frame_count-2 && it_per_id.feature_per_frame.size() >= 2)
	 {
		if(it_per_id.start_frame + it_per_id.frame_inc_num[it_per_id.frame_inc_num.size()-1] == frame_count -1)
		{
			parallax_sum += compensatedParallax3(it_per_id, it_per_id.frame_inc_num.size()-2, it_per_id.frame_inc_num.size()-1);
			parallax_num++;
		}
	 }*/
	 
    }

    if (parallax_num == 0)
    {
        return true;
    }
    else
    {
        ROS_DEBUG("parallax_sum: %lf, parallax_num: %d", parallax_sum, parallax_num);
        ROS_DEBUG("current parallax: %lf", parallax_sum / parallax_num * FOCAL_LENGTH);
        return parallax_sum / parallax_num >= MIN_PARALLAX;
    }
}

void FeatureManager::debugShow()
{
    ROS_DEBUG("debug show");
    for (auto &it : feature)
    {
        ROS_ASSERT(it.feature_per_frame.size() != 0);
        ROS_ASSERT(it.start_frame >= 0);
        ROS_ASSERT(it.used_num >= 0);

        ROS_DEBUG("%d,%d,%d ", it.feature_id, it.used_num, it.start_frame);
        int sum = 0;
        for (auto &j : it.feature_per_frame)
        {
            ROS_DEBUG("%d,", int(j.is_used));
            sum += j.is_used;
            printf("(%lf,%lf) ",j.point(0), j.point(1));
        }
        ROS_ASSERT(it.used_num == sum);
    }
}

namespace {
inline int findId(FeaturePerId& feature, int idx)
{
	int ret = -1;
	int start = idx - feature.start_frame; 
	start = (start <= feature.frame_inc_num.size() - 1) ? start :  feature.frame_inc_num.size() - 1; 
	for(int i = start; i>=0; i--)
	{
		int id = feature.start_frame + feature.frame_inc_num[i];
		if( id == idx)
		{
			ret = i; 
			return ret;
		}
		if(id < idx) // failed to find this frame (idx)
			break;
		
	}
	return ret; 
} 
}

vector<pair<Vector3d, Vector3d>> FeatureManager::getCorresponding(int frame_count_l, int frame_count_r)
{
    vector<pair<Vector3d, Vector3d>> corres;
    for (auto &it : feature)
    {
	int idx_l = findId(it, frame_count_l); 
	if(idx_l == -1) continue; 
	
	int idx_r = findId(it, frame_count_r); 
	if(idx_r == -1) continue; 

	Vector3d a = Vector3d::Zero(), b = Vector3d::Zero();
	a = it.feature_per_frame[idx_l].point;
	b = it.feature_per_frame[idx_r].point;
	corres.push_back(make_pair(a, b));
    }
    return corres;
}
/*
vector<pair<Vector3d, Vector3d>> FeatureManager::getCorresponding(int frame_count_l, int frame_count_r)
{
    vector<pair<Vector3d, Vector3d>> corres;
    for (auto &it : feature)
    {
	bool bl = false; 
	bool br = false; 
	int idx_l = -1; 
	int idx_r = -1; 
	for(int i=0; i<it.frame_inc_num.size(); i++)
	{
	    if(it.start_frame + it.frame_inc_num[i] == frame_count_l) 
	    {
		bl = true;
		idx_l = i; 
	    }
	    if(it.start_frame + it.frame_inc_num[i] == frame_count_r) 
	    {
		br = true; 
		idx_r = i;
	    }
	}
	if(bl && br)
	{
	    Vector3d a = Vector3d::Zero(), b = Vector3d::Zero();
	    a = it.feature_per_frame[idx_l].point;
	    b = it.feature_per_frame[idx_r].point;
	    corres.push_back(make_pair(a, b));
	}
    }
    return corres;
}*/
/*
vector<pair<Vector3d, Vector3d>> FeatureManager::getCorresponding(int frame_count_l, int frame_count_r)
{
    vector<pair<Vector3d, Vector3d>> corres;
    for (auto &it : feature)
    {
        if (it.start_frame <= frame_count_l && it.endFrame() >= frame_count_r)
        {
            Vector3d a = Vector3d::Zero(), b = Vector3d::Zero();
            int idx_l = frame_count_l - it.start_frame;
            int idx_r = frame_count_r - it.start_frame;

            a = it.feature_per_frame[idx_l].point;

            b = it.feature_per_frame[idx_r].point;
            
            corres.push_back(make_pair(a, b));
        }
    }
    return corres;
}*/

void FeatureManager::setDepth(const VectorXd &x)
{
    int feature_index = -1;
    for (auto &it_per_id : feature)
    {
        it_per_id.used_num = it_per_id.feature_per_frame.size();
        if (!(it_per_id.used_num >= 2 && it_per_id.start_frame < WINDOW_SIZE - 2))
            continue;

        it_per_id.estimated_depth = 1.0 / x(++feature_index);
        //ROS_INFO("feature id %d , start_frame %d, depth %f ", it_per_id->feature_id, it_per_id-> start_frame, it_per_id->estimated_depth);
        if (it_per_id.estimated_depth < 0)
        {
            it_per_id.solve_flag = 2;
        }
        else
            it_per_id.solve_flag = 1;
    }
}

void FeatureManager::removeFailures()
{
    // int n = 0;
    // static int sum_n = 0; 
    // static int num_sum_n = 0;
    for (auto it = feature.begin(), it_next = feature.begin();
         it != feature.end(); it = it_next)
    {
        it_next++;
        if (it->solve_flag == 2)
         {
          feature.erase(it);
	   // ++n;
        }
    }
    // ROS_WARN("remove failures %d", n); 
    // sum_n += n;
    // ++num_sum_n; 
    // ROS_WARN("avg remove failures %d", (int)(sum_n)/num_sum_n);
}

void FeatureManager::clearDepth(const VectorXd &x)
{
    int feature_index = -1;
    for (auto &it_per_id : feature)
    {
        it_per_id.used_num = it_per_id.feature_per_frame.size();
        if (!(it_per_id.used_num >= 2 && it_per_id.start_frame < WINDOW_SIZE - 2))
            continue;
        it_per_id.estimated_depth = 1.0 / x(++feature_index);
    }
}

VectorXd FeatureManager::getDepthVector()
{
    VectorXd dep_vec(getFeatureCount());
    int feature_index = -1;
    for (auto &it_per_id : feature)
    {
        it_per_id.used_num = it_per_id.feature_per_frame.size();
        if (!(it_per_id.used_num >= 2 && it_per_id.start_frame < WINDOW_SIZE - 2))
            continue;
#if 1
        dep_vec(++feature_index) = 1. / it_per_id.estimated_depth;
#else
        dep_vec(++feature_index) = it_per_id->estimated_depth;
#endif
    }
    return dep_vec;
}

VectorXd FeatureManager::getCountVector()
{
	VectorXd count(getFeatureCount()); 
	int feature_index = -1;
	for(auto &it_per_id : feature)
	{
		it_per_id.used_num = it_per_id.feature_per_frame.size(); 
		if (!(it_per_id.used_num >= 2 && it_per_id.start_frame < WINDOW_SIZE - 2))
            		continue;
		count(++feature_index) = (double)(it_per_id.used_num);
	}
	return count;
}

void FeatureManager::triangulate(Vector3d Ps[], Vector3d tic[], Matrix3d ric[])
{
    for (auto &it_per_id : feature)
    {
        it_per_id.used_num = it_per_id.feature_per_frame.size();
        if (!(it_per_id.used_num >= 2 && it_per_id.start_frame < WINDOW_SIZE - 2))
            continue;

        if (it_per_id.estimated_depth > 0)
            continue;
        int imu_i = it_per_id.start_frame, imu_j = imu_i - 1;

        ROS_ASSERT(NUM_OF_CAM == 1);
        Eigen::MatrixXd svd_A(2 * it_per_id.feature_per_frame.size(), 4);
        int svd_idx = 0;

        Eigen::Matrix<double, 3, 4> P0;
        Eigen::Vector3d t0 = Ps[imu_i] + Rs[imu_i] * tic[0];
        Eigen::Matrix3d R0 = Rs[imu_i] * ric[0];
        P0.leftCols<3>() = Eigen::Matrix3d::Identity();
        P0.rightCols<1>() = Eigen::Vector3d::Zero();

        // for (auto &it_per_frame : it_per_id.feature_per_frame)
	 for (int i=0; i<it_per_id.feature_per_frame.size(); i++)
        {
            // imu_j++;
	     imu_j = imu_i + it_per_id.frame_inc_num[i];

            Eigen::Vector3d t1 = Ps[imu_j] + Rs[imu_j] * tic[0];
            Eigen::Matrix3d R1 = Rs[imu_j] * ric[0];
            Eigen::Vector3d t = R0.transpose() * (t1 - t0);
            Eigen::Matrix3d R = R0.transpose() * R1;
            Eigen::Matrix<double, 3, 4> P;
            P.leftCols<3>() = R.transpose();
            P.rightCols<1>() = -R.transpose() * t;
            // Eigen::Vector3d f = it_per_frame.point.normalized();
	     Eigen::Vector3d f = it_per_id.feature_per_frame[i].point.normalized();
            svd_A.row(svd_idx++) = f[0] * P.row(2) - f[2] * P.row(0);
            svd_A.row(svd_idx++) = f[1] * P.row(2) - f[2] * P.row(1);

            if (imu_i == imu_j)
                continue;
        }
        ROS_ASSERT(svd_idx == svd_A.rows());
        Eigen::Vector4d svd_V = Eigen::JacobiSVD<Eigen::MatrixXd>(svd_A, Eigen::ComputeThinV).matrixV().rightCols<1>();
        double svd_method = svd_V[2] / svd_V[3];
        //it_per_id->estimated_depth = -b / A;
        //it_per_id->estimated_depth = svd_V[2] / svd_V[3];

        it_per_id.estimated_depth = svd_method;
        //it_per_id->estimated_depth = INIT_DEPTH;

        if (it_per_id.estimated_depth < 0.1)
        {
            it_per_id.estimated_depth = INIT_DEPTH;
        }

    }
}

void FeatureManager::removeOutlier()
{
    ROS_BREAK();
    int i = -1;
    for (auto it = feature.begin(), it_next = feature.begin();
         it != feature.end(); it = it_next)
    {
        it_next++;
        i += it->used_num != 0;
        if (it->used_num != 0 && it->is_outlier == true)
        {
            feature.erase(it);
        }
    }
}

void FeatureManager::removeBackShiftDepth2(Eigen::Matrix3d marg_R, Eigen::Vector3d marg_P, Eigen::Matrix3d Ric, Eigen::Vector3d tic)
{
    Eigen::Matrix3d new_R; 
    Eigen::Vector3d new_P; 
    Eigen::Matrix3d Rc = Rs[0] * Ric; 
    Eigen::Vector3d Pc = Ps[0] + Rs[0] * tic;
    for(auto it = feature.begin(), it_next = feature.begin(); 
        it != feature.end(); it = it_next)
    {
	it_next++; 
	if(it->start_frame != 0)
	    it->start_frame--;
	else
	{
	    Eigen::Vector3d uv_i = it->feature_per_frame[0].point;
	    it->feature_per_frame.erase(it->feature_per_frame.begin());
	    if(it->feature_per_frame.size() < 2)
	    {
		feature.erase(it); 
		continue; 
	    }else{
		if(it->frame_inc_num[1] == 1)
		{
		    new_R = Rc; 
		    new_P = Pc;
		}else
		{
		    int imu_j = it->frame_inc_num[1] -1 ;
		    new_R = Rs[imu_j] * Ric;
		    new_P = Ps[imu_j] + Rs[imu_j] * tic;
		}
		Eigen::Vector3d pts_i = uv_i * it->estimated_depth; 
		Eigen::Vector3d v_pts_i = marg_R * pts_i + marg_P;
		Eigen::Vector3d pts_j = new_R.transpose() * (v_pts_i - new_P);
		double dep_j = pts_j(2); 
		if(dep_j > 0)
		    it->estimated_depth = dep_j; 
		else
		    it->estimated_depth = INIT_DEPTH; 
		
		// handle frame_inc_num
		it->erase_old(); 
	    }
	}
    }

}

void FeatureManager::removeBackShiftDepth(Eigen::Matrix3d marg_R, Eigen::Vector3d marg_P, Eigen::Matrix3d new_R, Eigen::Vector3d new_P)
{
    for (auto it = feature.begin(), it_next = feature.begin();
         it != feature.end(); it = it_next)
    {
        it_next++;

        if (it->start_frame != 0)
            it->start_frame--;
        else
        {
            Eigen::Vector3d uv_i = it->feature_per_frame[0].point;  
            it->feature_per_frame.erase(it->feature_per_frame.begin());
            if (it->feature_per_frame.size() < 2)
            {
                feature.erase(it);
                continue;
            }
            else
            {
                Eigen::Vector3d pts_i = uv_i * it->estimated_depth;
                Eigen::Vector3d w_pts_i = marg_R * pts_i + marg_P;
                Eigen::Vector3d pts_j = new_R.transpose() * (w_pts_i - new_P);
                double dep_j = pts_j(2);
                if (dep_j > 0)
                    it->estimated_depth = dep_j;
                else
                    it->estimated_depth = INIT_DEPTH;
            }
        }
        // remove tracking-lost feature after marginalize
        /*
        if (it->endFrame() < WINDOW_SIZE - 1)
        {
            feature.erase(it);
        }
        */
    }
}

void FeatureManager::removeBack()
{
    for (auto it = feature.begin(), it_next = feature.begin();
         it != feature.end(); it = it_next)
    {
        it_next++;

        if (it->start_frame != 0)
            it->start_frame--;
        else
        {
            it->feature_per_frame.erase(it->feature_per_frame.begin());
            if (it->feature_per_frame.size() == 0)
                feature.erase(it);
	    else
		it->erase_old(); 
        }
    }
}

/*
// they remove old feature observations by  it->feature_per_frame.erase(it->feature_per_frame.begin() + j);
// no idea why this operation will not cause segment error
void FeatureManager::removeFront(int frame_count)
{
    for (auto it = feature.begin(), it_next = feature.begin(); it != feature.end(); it = it_next)
    {
        it_next++;

        if (it->start_frame == frame_count)
        {
            it->start_frame--;
        }
        else
        {
            // bool verbose= false; 
          
            int j = WINDOW_SIZE - 1 - it->start_frame;
	     // if(it->feature_per_frame.size() - 1 + it->start_frame < WINDOW_SIZE - 1)
	     {
			// ROS_INFO("what? it->feature_per_frame.size = %d, the last frame id: %d ", it->feature_per_frame.size(), 
				// it->start_frame + it->frame_inc_num[it->feature_per_frame.size()-1]);
			// ROS_WARN("j = %d", j);
			// verbose = true; 
	     }
            it->feature_per_frame.erase(it->feature_per_frame.begin() + j);
	     
		//if(verbose)
		{
			//ROS_INFO("after erase, it->feature_per_frame.size = %d ",  it->feature_per_frame.size());
			//if(it->feature_per_frame.size() > 0)
				//ROS_WARN("the last frame id: %d", it->start_frame + it->frame_inc_num[it->feature_per_frame.size()-1]);
		}
	     // it->frame_inc_num.erase(it->frame_inc_num.begin() + j);
            if (it->feature_per_frame.size() == 0)
                feature.erase(it);
        }
    }
}*/

void FeatureManager::removeFront(int frame_count)
{
    for (auto it = feature.begin(), it_next = feature.begin(); it != feature.end(); it = it_next)
    {
        it_next++;

        if (it->start_frame == frame_count)
        {
            it->start_frame--;
        }
        else
        {	
           int inc =  (frame_count - it->start_frame); 
  	    inc = (inc <= it->frame_inc_num.size()-1 ? inc :  it->frame_inc_num.size()-1); 
	    vector<FeaturePerFrame>::iterator it_f = it->feature_per_frame.begin() + inc; 
	    vector<int>::iterator it_inc = it->frame_inc_num.begin() + inc; 

	    while(true)
	    {
	       int frame_id = it->start_frame + (*it_inc) ;
		if(frame_id == frame_count)
			(*it_inc)--;
		else if(frame_id == frame_count-1) // this is the front node to be removed  
		{
			it_inc = it->frame_inc_num.erase(it_inc); 
			it_f = it->feature_per_frame.erase(it_f); 
		}else if(frame_id < frame_count -1 )
		{
			break;
		}
		if(it_f == it->feature_per_frame.begin())
		{
			break; 
		}
		--it_f;
		--it_inc;
	    }

            // int j = WINDOW_SIZE - 1 - it->start_frame;
            // it->feature_per_frame.erase(it->feature_per_frame.begin() + j);
            if (it->feature_per_frame.size() == 0)
                feature.erase(it);
        }
    }
}

/*
void FeatureManager::removeFront(int frame_count)
{
    for (auto it = feature.begin(), it_next = feature.begin(); it != feature.end(); it = it_next)
    {
        it_next++;

        if (it->start_frame == frame_count)
        {
            it->start_frame--;
        }
        else
        {
	    vector<FeaturePerFrame>::iterator it_f = it->feature_per_frame.begin(); 
	    vector<int>::iterator it_inc = it->frame_inc_num.begin(); 
	    
	    while(it_inc != it->frame_inc_num.end() && 
		it_f != it->feature_per_frame.end())
	    {
		if(it->start_frame + (*it_inc) ==  frame_count - 1) // frame_count =  WINDOW_SIZE 
		{
		    it_f = it->feature_per_frame.erase(it_f); 
		    it_inc = it->frame_inc_num.erase(it_inc); 
		    // break;
		    continue; 
		}
		if(it->start_frame + (*it_inc) == frame_count)
		{
			(*it_inc)--;
			// ROS_DEBUG("feature_manager: here I am, reason for fail in SFM");
			break;
		}
		++it_f; 
		++it_inc; 
	    }

            // int j = WINDOW_SIZE - 1 - it->start_frame;
            // it->feature_per_frame.erase(it->feature_per_frame.begin() + j);
            if (it->feature_per_frame.size() == 0)
                feature.erase(it);
        }
    }
}
*/
double FeatureManager::computeParallax(const FeaturePerFrame& frame_i, const FeaturePerFrame& frame_j)
{
    double ans = 0;
    Vector3d p_j = frame_j.point;

    double u_j = p_j(0);
    double v_j = p_j(1);

    Vector3d p_i = frame_i.point;
    Vector3d p_i_comp;

    //int r_i = frame_count - 2;
    //int r_j = frame_count - 1;
    //p_i_comp = ric[camera_id_j].transpose() * Rs[r_j].transpose() * Rs[r_i] * ric[camera_id_i] * p_i;
    p_i_comp = p_i;
    double dep_i = p_i(2);
    double u_i = p_i(0) / dep_i;
    double v_i = p_i(1) / dep_i;
    double du = u_i - u_j, dv = v_i - v_j;

    double dep_i_comp = p_i_comp(2);
    double u_i_comp = p_i_comp(0) / dep_i_comp;
    double v_i_comp = p_i_comp(1) / dep_i_comp;
    double du_comp = u_i_comp - u_j, dv_comp = v_i_comp - v_j;

    ans = max(ans, sqrt(min(du * du + dv * dv, du_comp * du_comp + dv_comp * dv_comp)));

    return ans;
}

double FeatureManager::compensatedParallax2(const FeaturePerId &it_per_id, int frame_count)
{
    //check the second last frame is keyframe or not
    //parallax betwwen seconde last frame and third last frame
    const FeaturePerFrame &frame_i = it_per_id.feature_per_frame[frame_count - 2 - it_per_id.start_frame];
    const FeaturePerFrame &frame_j = it_per_id.feature_per_frame[frame_count - 1 - it_per_id.start_frame];
    return computeParallax(frame_i, frame_j); 
}
