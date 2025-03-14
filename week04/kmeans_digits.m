clc;clear;close all
%% 加载数据
rng('default')
load digits.mat
%% 数据预处理
data = zscore(data);
[~,score] = pca(data);
reduced_data = score(:,1:2);
%% keans聚类
[idx,C] = kmeans(reduced_data,10,"Display","final","Replicates",10);
figure;
[s,h] = silhouette(reduced_data,idx);
xlabel('Silhouette Value')
ylabel('Cluster')
sil = mean(s);
fprintf('聚类结果的轮廓值为 %d.\n',sil)
%% 结果可视化
close all


x_min = min(reduced_data(:,1)) - 1;
x_max = max(reduced_data(:,1)) + 1;
y_min = min(reduced_data(:,2)) - 1;
y_max = max(reduced_data(:,2)) + 1;

h = 0.02;

[xx,yy] = meshgrid(x_min:h:x_max,y_min:h:y_max);

grid_points = [xx(:),yy(:)];

grid_labels = knnsearch(C,grid_points);

Z = reshape(grid_labels,size(xx));

figure;

imagesc([x_min,x_max],[y_min,y_max],Z,'AlphaData',0.3)
colormap("jet")
hold on
clusterMeans2 = grpstats(score,idx,"mean");
gscatter(reduced_data(:,1),reduced_data(:,2),idx);
hold on
h2 = scatter(clusterMeans2(:,1),clusterMeans2(:,2),100,"kx","LineWidth",2);
hold off
legend('off')
title('K-means clustering on the digits dataset (PCA-reduced data)')


