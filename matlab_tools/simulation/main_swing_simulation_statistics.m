%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% main swing simulation using ISAM2 

add_path;

M = 500;
T1 = {};
g_pts = [];

i = 1;
while i<=M
    
    % [ data1, truth1, isam1, result1, options1 ] = swing_simulation_ISAM();
    [ data1, truth1, result1, options1, converge ] = swing_simulation_SFM();
    [ epts, g_pts] = extractTrajectory(result1, options1, truth1);
    if converge 
        T1{i} = epts;
        fprintf('run i = %d for M = %d\n', i, M);
        i = i + 1;
    else
        % plot_trajectory_and_gt(epts, g_pts, 'g');
        fprintf('fail to converge at i = %d\n', i);
    end
end
%
[mu1, sigma1, sigma_err1] = computeMeanSigma(T1, g_pts);

T2 = {};
i = 1;
while i<=M
   
    % [ data1, truth1, isam1, result1, options1 ] = swing_simulation_ISAM();
    [ data2, truth2, result2, options2, converge ] = swing_simulation_SFM_VINS(); 
    [epts, g_pts1] = extractTrajectory(result2, options2, truth2); 
    if converge
        T2{i} = epts;
        fprintf('run i = %d for M = %d \n', i, M);
        i = i + 1;
    else
        % plot_trajectory_and_gt(epts, g_pts1, 'r');
        fprintf('fail to converge at i = %d\n', i);
    end
end

[mu2, sigma2, sigma_err2] = computeMeanSigma(T2, g_pts); 

fmat = 'mu_sigma.mat';
save(fmat, 'mu1', 'sigma1', 'sigma_err1', 'mu2', 'sigma2', 'sigma_err2', 'g_pts');
fprintf('succeed to compute and save mean, sigma and ground truth\n');

% plot_result_statistics();






