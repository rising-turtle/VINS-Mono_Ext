%% 
% Feb. 10 2018, plot the result from statistics 

function plot_result_statistics(fmat_name)
clear;
if nargin == 0
    fmat_name = 'mu_sigma_no_noise.mat';
    fmat_name = 'mu_sigma_large_noise.mat';
    fmat_name = 'mu_sigma.mat';
end

load(fmat_name);

%% plot rmse 
% plot_rmse(mu1, mu2, g_pts); 
plot_rmse_ratio(mu1, mu2, g_pts, sigma_err1, sigma_err2);

%% plot trajectory 
plot_trajectory(mu1, sigma1, mu2, sigma2, g_pts); 

end

%% plot trajectory 
function plot_trajectory(mu1, sigma1, mu2, sigma2, g_pts)
figure;

% ground truth 
plot3(g_pts(:,1), g_pts(:,2), g_pts(:,3), 'Color', 'k', 'LineWidth', 2, 'Marker', '*'); % plot ground truth 
hold on; 

%import gtsam.*
%% Generate data
tilt = 30.*pi/180.;
R = tiltR(tilt);
 
% Proposed 
plot3(mu1(:,1), mu1(:,2), mu1(:,3), 'Color', 'g', 'LineWidth', 2, 'Marker', 's');
% VINS-Mono
plot3(mu2(:,1), mu2(:,2), mu2(:,3), 'Color', 'r', 'LineWidth', 2, 'Marker', '+');
  
legend('Ground Truth', 'Proposed', 'VINS-Mono');
 
%% plot mu1 sigma1
 for i = 2:size(mu1,1)
     P = sigma1{i};
     gPp = R*P*R';
     % cov_ellipse_3d(mu1(i,:), gPp, 'g');
 end


 %% plot mu2 sigma2
 for i = 2:size(mu2,1)
     P = sigma2{i};
     gPp = R*P*R';
     % cov_ellipse_3d(mu2(i,:), gPp, 'r');
 end

 
axis([-2 2 -1 14 -1 4]);axis equal
view(3)
% colormap('hot');
drawnow
grid on;
hold on;
xlabel('x')
ylabel('y')
zlabel('z')
zlim([0 1]);

end

%% plot rmse with bar 
function plot_rmse_ratio(mu1, mu2, g_pts, sigma_err1, sigma_err2)
    rmse1 = [0];
    rmse2 = [0]; 
    len = 0;
    tlen = [len];
    ratio_err1 = [0];
    ratio_err2 = [0];
    k = 3;
    for i=k+1:k:size(mu1, 1)
        r1 = computeRMSEArray(mu1(1:i,:), g_pts(1:i, :));
        r2 = computeRMSEArray(mu2(1:i,:), g_pts(1:i, :));
        dp = g_pts(i,:) - g_pts(i-k,:);
        dlen =  sqrt(dp*dp');
        len = len + dlen;
        if dlen < 0.5
            continue;
        end
        tlen = [tlen; len];
        rmse1 = [rmse1; r1];
        rmse2 = [rmse2; r2];
        ratio_err1 = [ratio_err1; sigma_err1(i)];
        ratio_err2 = [ratio_err2; sigma_err2(i)];
    end
    % draw bar
    errorbar(tlen, rmse1, ratio_err1, '*', 'MarkerFaceColor', 'green');
    hold on;
    grid on; 
    xlabel('Distance traveled [m]');
    ylabel('Average RMSE'); 
    
    % plot(rmse2, 'r-.s');
    shift_len = tlen - 0.1;
    errorbar(shift_len, rmse2, ratio_err2, 's', 'MarkerFaceColor', 'red');
    legend('Proposed', 'VINS-Mono');
    xlim([0 18]);
end

%% plot rmse
function plot_rmse(mu1, mu2, g_pts)
    rmse1 = [];
    rmse2 = []; 
    for i=1:size(mu1, 1)
        r1 = computeRMSEArray(mu1(1:i,:), g_pts(1:i, :));
        r2 = computeRMSEArray(mu2(1:i,:), g_pts(1:i, :));
        rmse1 = [rmse1; r1];
        rmse2 = [rmse2; r2];
    end
    plot(rmse1, 'g-*');
    hold on;
    grid on; 
    xlabel('Number of Poses');
    ylabel('RMSE'); 
    plot(rmse2, 'r-.s');

    legend('proposed', 'VINS-Mono');
end

%% plot covariance Ellipse
function cov_ellipse_3d(c,P, style)
    % covarianceEllipse3D plots a Gaussian as an uncertainty ellipse
    % Based on Maybeck Vol 1, page 366
    % k=2.296 corresponds to 1 std, 68.26% of all probability
    % k=11.82 corresponds to 3 std, 99.74% of all probability
    %
    % Modified from http://www.mathworks.com/matlabcentral/newsreader/view_thread/42966

    [e,s] = svd(P);
    % k = 11.82; 
    k=2.296;
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
    % sc = mesh(x, y, z, 'edgecolor', style(:));
    sc = plot3(x, y, z, style(:), 'LineWidth', 2);
    shading interp
    alpha(0.5)
    axis equal
end
