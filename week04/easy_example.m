%% K-means 简单示例
clc; clear; close all;

% 数据点
X = [2, 10;
     2, 5;
     8, 4;
     5, 8];

% 设定 K 值
K = 2;

% kmeans，设置初始迭代点和最大迭代次数
[labels, centroids] = kmeans(X, K, 'Start', [2,10; 5,8], 'MaxIter', 10);

% 打印簇中心
fprintf('Final Centroids:\n');
disp(centroids);


figure;
hold on;
scatter(X(labels==1,1), X(labels==1,2), 100, 'bo', 'filled'); 
scatter(X(labels==2,1), X(labels==2,2), 100, 'ro', 'filled'); 
scatter(centroids(:,1), centroids(:,2), 200, 'kx', 'LineWidth', 3); 
xlabel('X');
ylabel('Y');
title('K-Means Clustering');
legend('Cluster 1', 'Cluster 2', 'Centroids');
grid on;
hold off;
