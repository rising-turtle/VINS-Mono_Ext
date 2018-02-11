%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% main swing simulation using ISAM2 

M = 500;
T1 = {};
g_pts = [];
for i=1:M
    % [ data1, truth1, isam1, result1, options1 ] = swing_simulation_ISAM();
    [ data1, truth1, result1, options1 ] = swing_simulation_SFM();
    [ epts, g_pts] = extractTrajectory(result1, options1, truth1); 
    T1{i} = epts; 
end

[mu1, sigma1] = computeMeanSigma(T1); 

T2 = {};
for i=1:M
    % [ data1, truth1, isam1, result1, options1 ] = swing_simulation_ISAM();
    [ data2, truth2, result2, options2 ] = swing_simulation_SFM_VINS(); 
    epts = extractTrajectory(result2, options2, truth2); 
    T2{i} = epts; 
end

[mu2, sigma2] = computeMeanSigma(T2); 

fmat = 'mu_sigma.mat';
save(fmat, 'mu1', 'sigma1', 'mu2', 'sigma2', 'g_pts');












