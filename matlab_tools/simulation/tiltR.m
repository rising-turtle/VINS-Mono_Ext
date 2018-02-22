
function R = tiltR(tilt)
    angle = -(pi/2+tilt);
    ca = cos(angle); sa = sin(angle);
    R = [1 0 0;
     0 ca -sa;
     0 sa ca;];
end