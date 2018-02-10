%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% plot the result of isam2
function e_pts = extractTrajectory(result, options)

%% Plot cameras
import gtsam.*
M = 1;

%% gt_pts, and estimate_pts 
e_pts = [];

while result.exists(symbol('x',M))
    ii = symbol('x',M);
    pose_i = result.at(ii);
    
    ept = pose2pt(pose_i);
    e_pts = [e_pts; ept];
    
    M = M + options.cameraInterval;
end

end