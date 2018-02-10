% given camera pose, and feature locations, generate observations
function [obs, feats] = createObservations_VINS(feats, pts, tilt)
% compute camera's tilt rotation 
angle = -(pi/2+tilt); 
ca = cos(angle); 
sa = sin(angle); 
Ro2c = [1 0 0;
     0 ca -sa;
     0 sa ca;];

Rc2o = Ro2c';

% get feature points
cnt = zeros(length(feats), 1);
gpc = get_feature_pc(feats); 

% hold on; 
% ggpt = gpc';
% scatter3(ggpt(:,1), ggpt(:,2), ggpt(:,3), 'g');

N = size(gpc,2);
% camera model 
cam = get_rs_r200(); 

obs = [];
%% 
pre_obs = [];
cur_obs = [];
next_feat_id = length(feats) + 1;
for i=1:size(pts,1)
    t = pts(i, :)'; 
    t = -Rc2o * t;
    lpc = transform_pc(Rc2o, t, gpc);
    
%     lppt = lpc';
%     figure;
%     grid on;
%     scatter3(lppt(:,1), lppt(:,2), lppt(:,3), 'g');
    
    %% check out how many features are available 
    s_obi.obs=[];
    
    %% update pre_obs and cur_obs
    pre_obs = cur_obs; 
    cur_obs = [];
    for j=1:N
        gpt = gpc(:, j);
        fpt = lpc(:, j); 
        [good, px, py] = in_cam_view(cam, fpt);
        if good == 1
            obs_ij = [];
            o.pt = gpt;
            o.id = feats(j).id; 
            cur_obs = [cur_obs; o];
            %% check whether this point has been seen in previous pts
            feat_id = in_pre_obs(gpt, pre_obs);
            if feat_id >= 0 % observed in pre_obs
                obs_ij = generate_obs_new(gpt, fpt, i, feat_id, px, py);
            else % new detected feature
                %% check whether need to create new feature point
                if cnt(feats(j).id) == 0 % use predefined point is ok
                    cnt(feats(j).id) = cnt(feats(j).id) + 1;
                    obs_ij = generate_obs_new(gpt, fpt, i, feats(j).id, px, py);
                else % need to create new feature
                    feat.x = gpt(1); feat.y = gpt(2); feat.z = gpt(3);
                    feat.id = next_feat_id; 
                    obs_ij = generate_obs_new(gpt, fpt, i, feat.id, px, py);
                    next_feat_id = next_feat_id + 1;
                    feats = [feats; feat];
                end
                
            end
            obs_ij = generate_obs(feats(j), i, fpt, px, py);
            s_obi.obs = [s_obi.obs; obs_ij];
        end
    end
    
    % add features into observation 
    obs = [obs; s_obi];
end

end

%% check out whether this gpt has been observed
function feat_id = in_pre_obs(gpt, pre_obs)
    feat_id = -1;
    for i=1:length(pre_obs)
        o = pre_obs(i);
        if o.pt(1) == gpt(1) && o.pt(2) == gpt(2) && o.pt(3) == gpt(3)
            feat_id = o.id;
            break;
        end
    end
end

%% generate observation for this point
function obs = generate_obs_new(gpt, lpt,  pose_id, feat_id, px, py)
    obs.gpt = gpt;
    obs.lpt = lpt;
    obs.pose_id = pose_id;
    obs.feat_id = feat_id;
    obs.obs_x = px;
    obs.obs_y = py; 
end

%% generate observation for this point
function obs = generate_obs(feat, pose_i, lpt, px, py)
    gpt = [feat.x feat.y feat.z];
    obs.gpt = gpt;
    obs.lpt = lpt;
    obs.pose_id = pose_i;
    obs.feat_id = feat.id;
    obs.obs_x = px;
    obs.obs_y = py; 
end

%% get point cloud from features
function gpc = get_feature_pc(feats)
    n = length(feats);
    gpc = zeros(3, n);
    for i = 1:n
        ft = feats(i); 
        gpc(1, i) = ft.x;
        gpc(2, i) = ft.y; 
        gpc(3, i) = ft.z;
    end
end

%% transform point cloud from global coordinate into camera's coordinate 
function lpc = transform_pc(R, t, gpc)
    [m, n] = size(gpc); 
    translation = repmat(t, 1, n); 
    lpc = R * gpc + translation; 
end

