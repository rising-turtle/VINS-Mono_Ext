%% 
% Feb. 9 2018, He Zhang, hxzhang1@ualr.edu 
% compute rmse given the vector 

function plotRMSE(rmse1, rmse2)

plot(rmse1, 'g-*');
hold on;
grid on; 
xlabel('Number of Poses');
ylabel('RMSE'); 
plot(rmse2, 'r-.s');

legend('proposed', 'VINS-Mono');
end