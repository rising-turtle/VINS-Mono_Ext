%%
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu
% plot the result of isam2
function swing_simulation_Plot(truth, isam, result, options)

% h=gca;
% cla(h);
hold on;

%% Plot points
% Can't use data because current frame might not see all points
marginals = Marginals(isam.getFactorsUnsafe(), isam.calculateEstimate()); % TODO - this is slow
% gtsam.plot3DPoints(result, [], marginals);

%% Plot cameras
import gtsam.*
M = 1;

%% gt_pts, and estimate_pts 
g_pts = [];
e_pts = [];

while result.exists(symbol('x',M))
    ii = symbol('x',M);
    pose_i = result.at(ii);
    if M==1
        plot_axis(pose_i, 0.5);
    end
    
    if options.hardConstraint && (M==1)
        plot_pose3(pose_i,[]); % 10
    else
        P = marginals.marginalCovariance(ii);
        plot_pose3(pose_i,P); % 10
    end
    if options.drawTruePoses % show ground truth
        plot_pose3(truth.cameras{M}.pose,[]);
        pt = pose2pt(truth.cameras{M}.pose);
        g_pts = [g_pts; pt];
    end
    
    ept = pose2pt(pose_i);
    e_pts = [e_pts; ept];
    
    M = M + options.cameraInterval;
end

%% draw
% axis([-40 40 -40 40 -10 20]);axis equal
axis([-2 2 -1 14 -1 4]);axis equal
view(3)
% colormap('hot');
drawnow
grid on;
xlabel('x')
ylabel('y')
zlabel('z')

hold on;
if options.drawTruePoses
    plot3(g_pts(:,1), g_pts(:,2), g_pts(:,3), 'Color', 'k', 'LineWidth', 2);
end
plot3(e_pts(:,1), e_pts(:,2), e_pts(:,3), 'Color', 'r', 'LineWidth', 2);


end

%% plot camera pose
function plot_pose3(pose, P)
    if (nargin >= 2) && (~isempty(P))
        gRp = pose.rotation().matrix();  % rotation from pose to global
        C = pose.translation().vector();
        pPp = P(4:6,4:6); % covariance matrix in pose coordinate frame    
        gPp = gRp*pPp*gRp'; % convert the covariance matrix to global coordinate frame
        cov_ellipse_3d(C,gPp);  
    end
end

%% plot covariance Ellipse
function cov_ellipse_3d(c,P)
    % covarianceEllipse3D plots a Gaussian as an uncertainty ellipse
    % Based on Maybeck Vol 1, page 366
    % k=2.296 corresponds to 1 std, 68.26% of all probability
    % k=11.82 corresponds to 3 std, 99.74% of all probability
    %
    % Modified from http://www.mathworks.com/matlabcentral/newsreader/view_thread/42966

    [e,s] = svd(P);
    k = 11.82; 
    radii = k*sqrt(diag(s));

    % generate data for "unrotated" ellipsoid
    [xc,yc,zc] = ellipsoid(0,0,0,radii(1),radii(2),radii(3),8);

    % rotate data with orientation matrix U and center M
    data = kron(e(:,1),xc) + kron(e(:,2),yc) + kron(e(:,3),zc);
    n = size(data,2);
    x = data(1:n,:)+c(1); 
    y = data(n+1:2*n,:)+c(2); 
    z = data(2*n+1:end,:)+c(3);

    % now plot the rotated ellipse
    % sc = surf(x,y,z,abs(xc));
    % sc = mesh(x, y, z, abs(xc));
    % sc = mesh(x, y, z, 'edgecolor', 'g');
    sc = plot3(x, y, z, 'r-');
    shading interp
    alpha(0.5)
    axis equal
end

%% plot axis 
function plot_axis(pose, axisLength)
    % get rotation and translation (center)
    gRp = pose.rotation().matrix();  % rotation from pose to global
    C = pose.translation().vector();

    if ~isempty(axisLength)
        % draw the camera axes
        xAxis = C+gRp(:,1)*axisLength;
        L = [C xAxis]';
        line(L(:,1),L(:,2),L(:,3),'Color','r','LineWidth',4);

        yAxis = C+gRp(:,2)*axisLength;
        L = [C yAxis]';
        line(L(:,1),L(:,2),L(:,3),'Color','g','LineWidth',4);

        zAxis = C+gRp(:,3)*axisLength;
        L = [C zAxis]';
        line(L(:,1),L(:,2),L(:,3),'Color','b','LineWidth',4);
    end
end

%% extract location from pose
function pt = pose2pt(pose)
    C = pose.translation().vector();
    pt = [C(1), C(2), C(3)];
end