%% 
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu 
% compute mean and sigma 
function [mu, sigma, err_sigma] = computeMeanSigma(T, g_pts)

%% compute mean 
import gtsam.*
M = size(T{1}, 1); 
mu = zeros(M, 3); 
err_sigma = zeros(M,1);
for i = 1:M
    e_pts = [];
    err = zeros(length(T),1);
    for j = 1:length(T)
        pt = T{j}(i, :);
        e_pts = [e_pts; pt];
        
        % compute the error of pose i
        g_pt = g_pts(i, :); 
        dpt = pt - g_pt; 
        err(j) = sqrt(dpt*dpt');
    end
    mu(i, : ) = mean(e_pts); 
    err_sigma(i) = std(err);
end

%% compute covarianze 
for i = 1:M
    e_pts = [];
    mu_i = mu(i, :);
    COV = zeros(3, 3); 
    for j = 1:length(T)
        pt = T{j}(i, :);
        dpt = pt - mu_i;
        COV = COV + dpt' * dpt;
    end
    COV = COV./length(T);
    sigma{i} = COV; 
end
    
end
