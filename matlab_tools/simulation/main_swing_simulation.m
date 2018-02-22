%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% main swing simulation using ISAM2

param_global;

% [ data1, truth1, isam1, result1, options1 ] = swing_simulation_ISAM();
% swing_simulation_ISAM_Plot(truth, data, isam, result, options);
% options1.drawTruePoses = true;
% swing_simulation_Plot_surf(truth1, isam1, result1, options1);

[ data1, truth1, result1, options1 ] = swing_simulation_SFM();

% options1.rmse_ratio = true;
rmse1 = computeRMSE(result1, truth1, options1); 

plot(rmse1, 'g-*');

% [ data2, truth2, isam2, result2, options2 ] = swing_simulation_ISAM_VINS(); 
% options2.drawTruePoses = true;
% swing_simulation_Plot(truth2, isam2, result2, options2);
% options2.rmse_ratio = true;
[ data2, truth2, result2, options2 ] = swing_simulation_SFM_VINS(); 
rmse2 = computeRMSE(result2, truth2, options2); 

 plotRMSE(rmse1, rmse2);







