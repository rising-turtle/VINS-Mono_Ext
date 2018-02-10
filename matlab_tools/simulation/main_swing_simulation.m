%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% main swing simulation using ISAM2

% [ data1, truth1, isam1, result1, options1 ] = swing_simulation_ISAM();

% swing_simulation_ISAM_Plot(truth, data, isam, result, options);
% options1.drawTruePoses = true;
% swing_simulation_Plot(truth1, isam1, result1, options1);

[ data2, truth2, isam2, result2, options2 ] = swing_simulation_ISAM_VINS(); 
options2.drawTruePoses = false;
swing_simulation_Plot(truth2, isam2, result2, options2);

