function [ image ] = Undistort(imageD, D, K, distModel)
%UNDISTORT Undistorts a camera image using either rad-tan or equidistant
%--------------------------------------------------------------------------
%   Required Inputs:
%--------------------------------------------------------------------------
%   imageD- distorted input image
%   D- 5x1 distortion vector
%   K-3x3 camera matrix
%   distModel- distortion model either 'equi' or 'radtan'
%
%--------------------------------------------------------------------------
%   Outputs:
%--------------------------------------------------------------------------
%   I- undistorted image
%
%--------------------------------------------------------------------------
%   References:
%--------------------------------------------------------------------------
%   This function is a slightly modified version of this stackoverflow code
%   http://stackoverflow.com/questions/12117825/how-can-i-undistort-an-image-in-matlab-using-the-known-camera-parameters

validateattributes(imageD,{'numeric'},{'2d'});
validateattributes(D,{'numeric'},{'vector'});
validateattributes(K,{'numeric'},{'size',[3,3]});
validateattributes(distModel,{'char'},{'vector'});

if(strcmpi('equi',distModel))
    equi = true;
elseif(strcmpi('radtan',distModel))
    equi = false;
else
    error('Only distortion models equi and radtan are supported');
end

D = D(:);
if(length(D) < 5);
    D(5) = 0;
end

%split up K and D into parameters of interest
fx = K(1,1);
fy = K(2,2);
cx = K(1,3);
cy = K(2,3);
k1 = D(1);
k2 = D(2);

if(equi)
    k3 = D(3);
    k4 = D(4);
else
    k3 = D(5);
    p1 = D(3);
    p2 = D(4);
end

image = zeros(size(imageD));
[i, j] = find(~isnan(image));

% Xp = the xyz vals of points on the z plane
Xp = K\[j i ones(length(i),1)]';

% Now we calculate how those points distort i.e forward map them through the distortion
x = Xp(1,:);
y = Xp(2,:);

if(equi)
    % theta = atan(sqrt(x.^2 + y.^2));
    % theta = (theta + k1*theta + k2*theta.^3 + k3*theta.^5 + k4*theta.^7);
    % omega = atan2(y,x);
    % x = theta.*cos(omega);
    % y = theta.*sin(omega);
    [x, y] = distortEquidist(x, y, D);
else
    r2 = x.^2 + y.^2;
    x = x.*(1+k1*r2 + k2*r2.^2 + k3*r2.^3) + 2*p1.*x.*y + p2*(r2 + 2*x.^2);
    y = y.*(1+k1*r2 + k2*r2.^2 + k3*r2.^3) + 2*p2.*x.*y + p1*(r2 + 2*y.^2);
end

% u and v are now the distorted cooridnates
u = reshape(fx*x + cx,size(image));
v = reshape(fy*y + cy,size(image));

c = class(imageD);

% Now we perform a backward mapping in order to undistort the warped image coordinates
image = interp2(double(imageD), u, v);

image = eval([c '(image)']);

end
