%%
% Feb. 10 2018, tune parameters

global g_param;
%% noise 
g_param.odo_t_std = 0.05; % 0.15;
g_param.odo_R_std = 0.01; % 0.02;
g_param.pt_std = 0.05;
g_param.pix_std = 1.; % 2.;

g_param.H = 0.7;
g_param.feature_step = 0.5;
g_param.pose_step = 0.3;
g_param.swing_times = 7;
g_param.num_pts = 70;

g_param.iterate_num = 10;