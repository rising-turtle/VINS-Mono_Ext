%% 
% Feb. 7 2018, He Zhang, hxzhang1@ualr.edu
% generate swing motion data, and save it into GTSAM's data structure 
function [ data, truth ] = swing_simulation_ISAM_data(options)

if nargin == 0
    options = default_option();
end

%% generate swing motion given tilt angle and H
tilt = 30.*pi/180.;
H = 3; % 1.2
R = tiltR(tilt);
[obs, pts, vfeats] = swing_simulation(tilt, H); 

%% generate simulated data 
import gtsam.*
gtR = gtsam.Rot3(R);
options.nrCameras = size(pts,1);

%% features in the global point
for i=1:length(vfeats)
    feat = vfeats(i);
    truth.points{i} = Point3([feat.x, feat.y, feat.z]');
    truth.point_id{feat.id} = i;  % feat located at index i
    truth.point_cnt{feat.id} = 0; % cnt the number of times this feat has been observed
    truth.point_first{feat.id} = -1; % first pose id when this feat is observed
    truth.point_first_z{feat.id} = Point2;
end

%% camera poses
r200 = get_rs_r200();
truth.K = Cal3_S2(r200.fx, r200.fy, 0, r200.cx, r200.cy);
data.K = truth.K;
for i=1:length(pts)
    pt = pts(i,:);
    t = Point3(pt');
    % truth.cameras{i} = SimpleCamera.Lookat(t, Point3, Point3([0,0,1]'), truth.K);
    pose = Pose3(gtR, t); 
    truth.cameras{i} = SimpleCamera(pose, truth.K);
    obs_i = obs(i);
    for j=1:length(obs_i.obs)
        obs_ij = obs_i.obs(j);
        % data.Z{i}{j} = Point2(obs_ij.obs_x, obs_ij.obs_y);
        % data.Z{i}{j} = truth.cameras{i}.project(truth.points{truth.point_id{obs_ij.feat_id}});
        data.Z{i}{j} = truth.cameras{i}.project(Point3(obs_ij.gpt'));
        data.J{i}{j} = obs_ij.feat_id;
    end
end

%% show images if asked
if options.showImages
    gui = gcf;
    for i=1:options.nrCameras
        figure(2+i);clf;hold on
        set(2+i,'NumberTitle','off','Name',sprintf('Camera %d',i));
        for j=1:nrPoints
            zij = truth.cameras{i}.project(truth.points{j});
            plot(zij.x,zij.y,'*');
            axis([1 640 1 480]);
        end
    end
    figure(gui);
end

%% Calculate odometry between cameras
odometry = truth.cameras{1}.pose.between(truth.cameras{2}.pose);
for i=1:options.nrCameras-1
    data.odometry{i}=odometry;
end

end

function R = tiltR(tilt)
    angle = -(pi/2+tilt);
    ca = cos(angle); sa = sin(angle);
    R = [1 0 0;
     0 ca -sa;
     0 sa ca;];
end

