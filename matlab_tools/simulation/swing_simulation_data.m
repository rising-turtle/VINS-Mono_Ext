%% 
% Feb. 5 2018, He Zhang, hxzhang1@ualr.edu
% simulate swing motion 
function [obs, pts, vfeats] = swing_simulation_data(tilt, H)
%% parameters 
param_global;
global g_param;
if nargin == 0
    H = g_param.H; % camera's height installed in robocane
    tilt = 30.*pi/180.; % camera's tilt angle
end

%% generate features 
% assume features 
step = g_param.feature_step; 
x = [-2.2:step:2.2];
y = [0:step:14]; 
z = 0; 
vfeats = createFeatureHorizontal(x, y, z); % create a number of features on a plane

%% generate trajectory 
px = [-g_param.x_range:g_param.pose_step:g_param.x_range]; 
n_swing = g_param.swing_times; % 7; 
pts = createTrajectory(px, H, n_swing); % create trajectory swing motion 

%% generate observations 
% given camera pose, and feature locations, generate observations
obs = createObservations(vfeats, pts, tilt); 

% show_obs(obs);

end

%% show it
function show_obs(obs)
    for i =1:length(obs)
        obs_i = obs(i);
        for j = 1:length(obs_i.obs)
            obs_ij = obs_i.obs(j);
            fprintf('pose_id %d feat_id %d obs_x: %f obs_y %f\n', obs_ij.pose_id, ...
                obs_ij.feat_id, obs_ij.obs_x, obs_ij.obs_y);
            fprintf('gpt: %f %f %f, lpt: %f %f %f\n', obs_ij.gpt(1), obs_ij.gpt(2), ...
                obs_ij.gpt(3), obs_ij.lpt(1), obs_ij.lpt(2), obs_ij.lpt(3));
        end
    end
end





