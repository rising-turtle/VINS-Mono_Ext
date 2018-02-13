%% 
% Feb. 10 2018, He Zhang, hxzhang1@ualr.edu
% run SFM using swing motion data, and then plot and save results  
function [ data, truth, result, options, converge ] = swing_simulation_SFM_VINS(options)
    clear;
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
    [obs, pts, vfeats] = swing_simulation_data_VINS(tilt, H); 
    [data,truth, options] = swing_simulation_ISAM_data(options, obs, pts, vfeats, R);
    
    [ data, truth, result, options, converge ] = SFM(data,truth, options);

end

