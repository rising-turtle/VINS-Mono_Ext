%% 
% process each step information  

function [isam,result,nextPoseIndex, new_truth] = swing_simulation_ISAM_Step(data,noiseModels,isam,result,truth,nextPoseIndex)

% iSAM expects us to give it a new set of factors 
% along with initial estimates for any new variables introduced.
import gtsam.*
newFactors = NonlinearFactorGraph;
initialEstimates = Values;

%% Add odometry
import gtsam.*
odometry = data.odometry{nextPoseIndex-1};
newFactors.add(BetweenFactorPose3(symbol('x',nextPoseIndex-1), symbol('x',nextPoseIndex), odometry, noiseModels.odometry));

%% Add visual measurement factors and initializations as necessary
import gtsam.*
for k=1:length(data.Z{nextPoseIndex})
    zij = data.Z{nextPoseIndex}{k};
    j = data.J{nextPoseIndex}{k};
    jj = symbol('l', j);
    if truth.point_cnt{j} == 0 % this feat is first time observed     
        truth.point_first{j} = nextPoseIndex;
        truth.point_first_z = zij;
    else
        if truth.point_cnt{j} == 1 % this feat is observed second time, add the first obs
            if truth.point_first{j} > 2 % the first two pose already added features
                newFactors.add(GenericProjectionFactorCal3_S2(truth.point_first_z, ... 
                    noiseModels.measurement, symbol('x',truth.point_first{j}), jj, data.K));
            end
        end
        %% add current obs
        newFactors.add(GenericProjectionFactorCal3_S2(zij, noiseModels.measurement, ...
            symbol('x',nextPoseIndex), jj, data.K));
        % TODO: initialize with something other than truth
        if ~result.exists(jj) && ~initialEstimates.exists(jj)
            % lmInit = truth.points{j};
            lmInit = truth.points{truth.point_id{j}};
            initialEstimates.insert(jj, lmInit);
        end
    end 
    truth.point_cnt{j} = truth.point_cnt{j} + 1;
end

%% Initial estimates for the new pose.
import gtsam.*
prevPose = result.at(symbol('x',nextPoseIndex-1));
initialEstimates.insert(symbol('x',nextPoseIndex), prevPose.compose(odometry));

%% Update ISAM
% figure(1);tic;
isam.update(newFactors, initialEstimates);
% t=toc; plot(frame_i,t,'r.'); tic
result = isam.calculateEstimate();
% t=toc; plot(frame_i,t,'g.');

% Update nextPoseIndex to return
nextPoseIndex = nextPoseIndex + 1;
% since truth has been changed
new_truth = truth; 
end


