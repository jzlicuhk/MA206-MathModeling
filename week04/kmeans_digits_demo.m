clc;clear;close all
%% 加载数据
rng('default')
% 将digits.mat 加载到工作区

%% 数据预处理
% 使用zscore函数标准化数据

% 使用pca函数将数据降维

%% keans聚类
% 使用kmeans函数实现聚类
% 查阅kmeans文档，调整kmeans的输入参数来优化算法

% 通过使用Silhouette函数生成轮廓系数和轮廓图来评估聚类方案


%% 结果可视化
close all

% 将最佳的聚类方案结果可视化