%% 
% Feb. 7 2018, He Zhang, hxzhang1@ualr.edu
% run ISAM using swing motion data, and then plot and save results  
function [ data, truth, isam, result, options ] = swing_simulation_ISAM(options)
    param_global;
    global g_param;
    if nargin == 0
        options = default_option();
    end
    import gtsam.*
    %% Generate data
    tilt = 30.*pi/180.;
    H = g_param.H; % 1.2
    R = tiltR(tilt);
    [obs, pts, vfeats] = swing_simulation_data(tilt, H); 
    [data,truth, options] = swing_simulation_ISAM_data(options, obs, pts, vfeats, R);
    
    %% Initialize iSAM with the first pose and points
    options.hardConstraint = true;
    [noiseModels,isam,result,nextPose, truth] = swing_simulation_ISAM_Initialize(data,truth,options);
    % cla;
    % VisualISAMPlot(truth, data, isam, result, options);
    
%% Main loop for iSAM: stepping through all poses
for frame_i=3:options.nrCameras
    [isam,result,nextPose, truth] = swing_simulation_ISAM_Step(data,noiseModels,isam,result,truth,nextPose);
    if mod(frame_i,options.drawInterval)==0
      % swing_simulation_ISAM_Plot(truth, data, isam, result, options)
    end
end
    
end
