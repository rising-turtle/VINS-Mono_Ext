%% plot trajectory 
function plot_trajectory_and_gt(mu1, g_pts, color)
figure; 
plot3(g_pts(:,1), g_pts(:,2), g_pts(:,3), 'Color', 'k', 'LineWidth', 2, 'Marker', '*'); % plot ground truth 
hold on; 

%import gtsam.*
%% Generate data
tilt = 30.*pi/180.;
R = tiltR(tilt);
    
%% plot mu1 sigma1
%  for i = 2:size(mu1,1)
%      P = sigma1{i};
%      gPp = R*P*R';
%       cov_ellipse_3d(mu1(i,:), gPp, 'g-');
%  end
 plot3(mu1(:,1), mu1(:,2), mu1(:,3), 'Color', color, 'LineWidth', 2, 'Marker', 's');

 
axis([-2 2 -1 14 -1 4]);axis equal
view(3)
% colormap('hot');
drawnow
grid on;
xlabel('x')
ylabel('y')
zlabel('z')

end




