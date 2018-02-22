%% 
% create swing trajectory 
% x: range of x, [xmin:xmax] 
% z: height of the pt
% r: radius of the swing arc, this can be computed  
% n: number of swing times 

function pts = createTrajectory(x, z, n)

    global g_param;
    swing_angle = g_param.swing_angle * pi / 180.; 
    pts = [];
    sx = x(end) - x(1); % length of x range
    AB = sx / cos(swing_angle); % -2*y1;
    r = (AB/sin(swing_angle))/2.;
    y1 = -(r - AB*sin(swing_angle)); %-sx / sqrt(3); 
    inc_y = 0;
    cnt = 0;
    for k=1:n
        % swing to
        py = 0;
        for i=1:length(x)
            px = x(i); 
            py = f(px, x(end), y1 + inc_y, r);
            pts = [pts; px, py, z];
            cnt = cnt + 1;
            if cnt >= g_param.num_pts
                return;
            end
                
        end
        inc_y = py; 
        
        % swing back 
        for i = length(x):-1:1
            px = x(i);
            py = f(px, x(1), y1 + inc_y, r);
            pts = [pts; px, py, z];
            cnt = cnt + 1;
            if cnt >= g_param.num_pts
                return;
            end
        end
        inc_y = py;
    end
    
    %% delete pose that are too close
    pts = deleteNearPt(pts, 0.1);
 
    %% show it
    % plot_it(pts);
    
end


%% delete pose that are too close
function r_pts = deleteNearPt(pts, thre)
    
    r_pts = pts(1,:);
    for i=2:size(pts,1)
        p1 = pts(i-1,:);
        p2 = pts(i,:);
        dp = p2 - p1;
        norm = sqrt(dp*dp');
        if norm >= thre
            r_pts = [r_pts; p2];
        end
    end
end

%% function of the circle, 
function y = f(x, cx, cy, r)
    y = sqrt(r^2 - (x-cx)^2) + cy;
end

%% display the trajectory of the generated motion  
function plot_it(pts)
    figure;
    scatter3(pts(:,1), pts(:,2), pts(:,3), 'r');
    hold on; 
    grid on; 
    axis([-1 1 0 12]);
    plot3(pts(:,1), pts(:,2), pts(:,3), 'b');
    view(2);
end
