%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% plot the result of isam2
function [e_pts, g_pts] = extractTrajectory(result, options, truth)

%% Plot cameras
import gtsam.*
M = 1;

%% gt_pts, and estimate_pts 
g_pts = [];
e_pts = [];

while result.exists(symbol('x',M))
    ii = symbol('x',M);
    pose_i = result.at(ii);
    
    ept = pose2pt(pose_i);
    e_pts = [e_pts; ept];
    gpi = pose2pt(truth.cameras{M}.pose); 
    g_pts = [g_pts; gpi];
    
    M = M + options.cameraInterval;
end

end