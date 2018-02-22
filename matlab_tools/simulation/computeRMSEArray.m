%% 
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu 
% compute rmse given the vector 
function r = computeRMSEArray(pts1, pts2)
    
    r2 = 0;
    for i=1:size(pts1,1)
        dp = pts1(i, :) - pts2(i, :);
        r2 = r2 + dp*dp';
    end
    r = r2/size(pts1,1);
    r = sqrt(r);
end


