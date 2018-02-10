%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% main swing simulation using ISAM2 

M = 2;
T1 = {};
for i=1:M
    % [ data1, truth1, isam1, result1, options1 ] = swing_simulation_ISAM();
    [ data1, truth1, result1, options1 ] = swing_simulation_SFM();
    epts = extractTrajectory(result1, options1); 
    T1{i} = epts; 
end

[mu1, sigma1] = computeMeanSigma(T1); 

T2 = {};
for i=1:M
    % [ data1, truth1, isam1, result1, options1 ] = swing_simulation_ISAM();
    [ data2, truth2, result2, options2 ] = swing_simulation_SFM_VINS(); 
    epts = extractTrajectory(result2, options2); 
    T2{i} = epts; 
end

[mu1, sigma1] = computeMeanSigma(T2); 












