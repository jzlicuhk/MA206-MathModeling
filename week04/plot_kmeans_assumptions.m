clc;clear;close all
%% 加载数据
X = readmatrix("X.csv");
X_aniso = readmatrix("X_aniso.csv");
X_filtered = readmatrix("X_filtered.csv");
X_varied = readmatrix("X_varied.csv");
%% 
clc
close all

figure;

subplot(2,2,1)
scatter(X(:,1),X(:,2),20,X(:,3),"filled")
xlabel 'x'
ylabel 'y'
title('高斯球状分布');
colormap("jet")

subplot(2,2,2)
scatter(X_aniso(:,1),X_aniso(:,2),20,X_aniso(:,3),'filled')
xlabel 'x'
ylabel 'y'
title('各向异性分布');
colormap("jet")

subplot(2,2,3)
scatter(X_varied(:,1),X_varied(:,2),20,X_varied(:,3),'filled')
xlabel 'x'
ylabel 'y'
title('不等方差分布');
colormap("jet")

subplot(2,2,4)
scatter(X_filtered(:,1),X_filtered(:,2),20,X_filtered(:,3),'filled')
xlabel 'x'
ylabel 'y'
title('大小不均匀的分布');
colormap("jet")

%% 
clc
close all

rng(2)

[idx,C] = kmeans(X(:,1:2),2);
[idx_aniso,C_aniso] = kmeans(X_aniso(:,1:2),3);
[idx_varied,C_varied] = kmeans(X_varied(:,1:2),3);
[idx_filtered,C_filtered] = kmeans(X_filtered(:,1:2),3);

figure;

subplot(2,2,1)
scatter(X(:,1),X(:,2),20,idx,"filled")
xlabel 'x'
ylabel 'y'
title('非最佳簇数');
colormap("jet")

subplot(2,2,2)
scatter(X_aniso(:,1),X_aniso(:,2),20,idx_aniso,'filled')
xlabel 'x'
ylabel 'y'
title('各向异性分布');
colormap("jet")

subplot(2,2,3)
scatter(X_varied(:,1),X_varied(:,2),20,idx_varied,'filled')
xlabel 'x'
ylabel 'y'
title('不等方差分布');
colormap("jet")

subplot(2,2,4)
scatter(X_filtered(:,1),X_filtered(:,2),20,idx_filtered,'filled')
xlabel 'x'
ylabel 'y'
title('大小不均匀的分布');
colormap("jet")
%% 
[idx,C] = kmeans(X(:,1:2),3);
[idx_filtered,C_filtered] = kmeans(X_filtered(:,1:2),3,"Replicates",10);

subplot(1,2,1)
scatter(X(:,1),X(:,2),20,idx,"filled")
xlabel 'x'
ylabel 'y'
title('解决非最佳簇数');
colormap("jet")

subplot(1,2,2)
scatter(X_filtered(:,1),X_filtered(:,2),20,idx_filtered,'filled')
xlabel 'x'
ylabel 'y'
title('解决大小不均匀的分布');
colormap("jet")
