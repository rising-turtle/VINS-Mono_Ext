%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% main swing simulation using ISAM2

[ data, truth, isam, result, options ] = swing_simulation_ISAM();

% swing_simulation_ISAM_Plot(truth, data, isam, result, options);
options.drawTruePoses = true;
swing_simulation_Plot(truth, isam, result, options);

swing_simulation_ISAM_VINS(); 
options.drawTruePoses = false;