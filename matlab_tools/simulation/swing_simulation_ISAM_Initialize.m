%% 
% Feb. 7 2018, He Zhang, hxzhang1@ualr.edu
% Initalize ISAM structure use the first pose and feature point 
function [ noiseModels,isam,result,nextPoseIndex, new_truth] = swing_simulation_ISAM_Initialize(data, truth, options)
    
%% Initialize iSAM
import gtsam.*
isam = ISAM2; 

param_global;
global g_param;

%% Set Noise parameters
import gtsam.*
noiseModels.pose = noiseModel.Diagonal.Sigmas([0.001 0.001 0.001 0.1 0.1 0.1]');
%noiseModels.odometry = noiseModel.Diagonal.Sigmas([0.001 0.001 0.001 0.1 0.1 0.1]');
% noiseModels.odometry = noiseModel.Diagonal.Sigmas([0.05 0.05 0.05 0.2 0.2 0.2]');
noiseModels.odometry = noiseModel.Diagonal.Sigmas([g_param.odo_R_std g_param.odo_R_std ... 
    g_param.odo_R_std g_param.odo_t_std g_param.odo_t_std g_param.odo_t_std]');
noiseModels.point = noiseModel.Isotropic.Sigma(3, g_param.pt_std);
noiseModels.measurement = noiseModel.Isotropic.Sigma(2, g_param.pix_std);

%% Add constraints/priors
% TODO: should not be from ground truth!
import gtsam.*
newFactors = NonlinearFactorGraph;
initialEstimates = Values;
for i=1:2
    ii = symbol('x',i);
    if i==1
        if options.hardConstraint % add hard constraint
            newFactors.add(NonlinearEqualityPose3(ii,truth.cameras{1}.pose));
        else
            newFactors.add(PriorFactorPose3(ii,truth.cameras{i}.pose, noiseModels.pose));
        end
    end
    initialEstimates.insert(ii,truth.cameras{i}.pose);
end

nextPoseIndex = 3;

%% Add visual measurement factors from two first poses and initialize observed landmarks
import gtsam.*
for i=1:2
    ii = symbol('x',i);
    for k=1:length(data.Z{i})
        j = data.J{i}{k};
        jj = symbol('l',data.J{i}{k});
        newFactors.add(GenericProjectionFactorCal3_S2(data.Z{i}{k}, noiseModels.measurement, ii, jj, data.K));
        if truth.point_cnt{j} == 0
            truth.point_first{j} = i; 
        end
        truth.point_cnt{j} = truth.point_cnt{j} + 1; % 1 means this factor has been added
        % TODO: initial estimates should not be from ground truth!
        if ~initialEstimates.exists(jj)
            initialEstimates.insert(jj, truth.points{truth.point_id{j}});
        end
        if options.pointPriors % add point priors
            newFactors.add(PriorFactorPoint3(jj, truth.points{truth.point_id{j}}, noiseModels.point));
        end
    end
end

%% Add odometry between frames 1 and 2
import gtsam.*
newFactors.add(BetweenFactorPose3(symbol('x',1), symbol('x',2), data.odometry{1}, noiseModels.odometry));

%% Update ISAM
import gtsam.*
if options.batchInitialization % Do a full optimize for first two poses
    batchOptimizer = LevenbergMarquardtOptimizer(newFactors, initialEstimates);
    fullyOptimized = batchOptimizer.optimize();
    isam.update(newFactors, fullyOptimized);
else
    isam.update(newFactors, initialEstimates);
end
% figure(1);tic;
% t=toc; plot(frame_i,t,'r.'); tic
result = isam.calculateEstimate();

% since truth has been changed
new_truth = truth; 

end