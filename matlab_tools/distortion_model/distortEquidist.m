
function [u, v] = distortEquidist(x, y, D)
    k1 = D(1);
    k2 = D(2);
    k3 = D(3);
    k4 = D(4); 
    u = repmat(x,1);
    v = repmat(y,1);
    for i = 1:size(u,1)
	xi = x(i);
	yi = y(i);
	r= sqrt(xi*xi + yi*yi);
	if r < 1e-8
	    continue;
	end
	th = atan(r);
	thd = th*(1.0 + k1*th.^2 + k2*th.^4 + k3*th.^6 + k4*th.^8); 
	s = thd/r;
	u(i) = xi * s; 
	v(i) = yi * s; 
    end
end


