function [ k1, k2, p1, p2, k3, err ] = Equi2Pin( imageSize, D, K )

if nargin == 0
    %% camera intrinsic parameters in TUM vio's dataset 
    imageSize = [512 512]; 
    D = [0.0034823894022493434, 0.0007150348452162257, -0.0020532361418706202, 0.00020293673591811182];
    % pinhole-equi-512
    intri = [190.97847715128717, 190.9733070521226, 254.93170605935475, 256.8974428996504];
    K = [intri(1) 0 intri(3)
        0 intri(2) intri(4)
        0 0 1];
end
%split up K and D into parameters of interest
fx = K(1,1);
fy = K(2,2);
cx = K(1,3);
cy = K(2,3);
k1 = D(1);
k2 = D(2);
k3 = D(3);
k4 = D(4);

image = zeros(imageSize);
[i, j] = find(~isnan(image));

% Xp = the xyz vals of points on the z plane
Xp = K\[j i ones(length(i),1)]';

% Now we calculate how those points distort i.e forward map them through the distortion
x = Xp(1,:);
y = Xp(2,:);

%get distorted points
% th = atan(sqrt(x.^2 + y.^2));
% theta = (theta + k1*theta + k2*theta.^3 + k3*theta.^5 + k4*theta.^7);
% thetad = th*(1.0 + k1*th.^2 + k2*th.^4 + k3*th.^6 + k4*th.^8); 
% omega = atan2(y,x);
% u = theta.*cos(omega);
% v = theta.*sin(omega);

% update equidist distort function
[u, v] = distortEquidist(x, y, D); 

%optimize
err_func = @(d) getPinErr(u,v,x,y,d);
[D,err] = fminunc(err_func, [0,0,0,0,0]);

k1 = D(1);
k2 = D(2);
k3 = D(5);
p1 = D(3);
p2 = D(4);
    
end

function [ err ] = getPinErr( u, v, x, y, D)

    k1 = D(1);
    k2 = D(2);
    k3 = D(5);
    p1 = D(3);
    p2 = D(4);
    
    r2 = x.^2 + y.^2;
    u_pin = x.*(1+k1*r2 + k2*r2.^2 + k3*r2.^3) + 2*p1.*x.*y + p2*(r2 + 2*x.^2);
    v_pin = y.*(1+k1*r2 + k2*r2.^2 + k3*r2.^3) + 2*p2.*x.*y + p1*(r2 + 2*y.^2);
    
    err = mean((u-u_pin).^2 + (v-v_pin).^2);
    
end