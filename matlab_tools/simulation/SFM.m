%%
% Feb. 10 2018, SFM 
function [ data, truth, result, options ] = SFM(data,truth, options)
    
    %% noise parameters
    param_global;
    global g_param;
    import gtsam.*
    measurementNoiseSigma = g_param.pix_std;
    pointNoiseSigma = g_param.pt_std;
    poseNoiseSigmas = [0.0001 0.0001 0.0001 0.001 0.001 0.001]';
    
    %% Create the graph (defined in visualSLAM.h, derived from NonlinearFactorGraph)
    graph = NonlinearFactorGraph;
    
    %% Add factors for all measurements
    measurementNoise = noiseModel.Isotropic.Sigma(2,measurementNoiseSigma);
    first_j = -1;
    for i=1:length(data.Z)
        for k=1:length(data.Z{i})
            j = data.J{i}{k};
            if truth.point_i_obs{j} >= 2
                graph.add(GenericProjectionFactorCal3_S2(data.Z{i}{k}, measurementNoise, symbol('x',i), symbol('p',j), data.K));
                if first_j == -1
                    first_j = j;
                end
            end
        end
    end
    
    %% Add Gaussian priors for a pose and a landmark to constrain the system
    posePriorNoise  = noiseModel.Diagonal.Sigmas(poseNoiseSigmas);
    graph.add(PriorFactorPose3(symbol('x',1), truth.cameras{1}.pose, posePriorNoise));
    pointPriorNoise  = noiseModel.Isotropic.Sigma(3,pointNoiseSigma);
    graph.add(PriorFactorPoint3(symbol('p',first_j), truth.points{first_j}, pointPriorNoise));

    % graph.print(sprintf('\nFactor graph:\n'));
    
    %% Initialize cameras and points close to ground truth in this example
    initialEstimate = Values;
    pre_pose = truth.cameras{1}.pose;
    initialEstimate.insert(symbol('x',1), pre_pose); 
    for i=2:size(truth.cameras,2)
        odometry = data.odometry{i-1};
        pose_i = pre_pose.compose(odometry); 
        initialEstimate.insert(symbol('x',i), pose_i);
        pre_pose = pose_i;
    end
    for j=1:size(truth.points,2)
        point_j = truth.points{j}.retract(g_param.pt_std*randn(3,1));
        if truth.point_i_obs{j} >= 2
            initialEstimate.insert(symbol('p',j), point_j);
        else
           % fprintf('feature %d has not been observed!\n', j);
        end
    end
    % initialEstimate.print(sprintf('\nInitial estimate:\n  '));
    %% Fine grain optimization, allowing user to iterate step by step
    parameters = LevenbergMarquardtParams;
    parameters.setlambdaInitial(1.0);
    parameters.setVerbosityLM('trylambda');

    optimizer = LevenbergMarquardtOptimizer(graph, initialEstimate, parameters);
    for i=1:g_param.iterate_num
        optimizer.iterate();
    end
    result = optimizer.values();
end