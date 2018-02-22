%% check out whether this feature point is in camera's view 
function [good, px, py] = in_cam_view(cam, pt)
    good = 0;
    px = -1;
    py = -1;
    if pt(3) <= 0 %% z <= 0
        return;
    end
    
    dx = 20;
    dy = 5;
    px = cam.cx + cam.fx * pt(1)/pt(3);
    py = cam.cy + cam.fy * pt(2)/pt(3);
    if px > dx && px < cam.width - dx  && py >dy && py < cam.height - dy
        good = 1;
    end
end