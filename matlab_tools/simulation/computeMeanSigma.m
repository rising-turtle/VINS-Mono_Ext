%% 
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu 
% compute mean and sigma 
function [mu, sigma] = computeMeanSigma(T)

%% compute mean 
import gtsam.*
M = size(T{1}, 1); 
mu = zeros(M, 3); 
for i = 1:M
    e_pts = [];
    for j = 1:length(T)
        pt = T{j}(i, :);
        e_pts = [e_pts; pt];
    end
    mu(i, : ) = mean(e_pts); 
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
