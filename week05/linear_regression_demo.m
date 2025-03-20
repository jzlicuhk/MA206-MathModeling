clc;clear;close all
% 加载California_housing数据集
% 以下是关于数据集的信息
% California Housing dataset
% --------------------------
%
% **Data Set Characteristics:**
%
% :Number of Instances: 20640
%
% :Number of Attributes: 8 numeric, predictive attributes and the target
%
% :Attribute Information:
%     - MedInc        median income in block group
%     - HouseAge      median house age in block group
%     - AveRooms      average number of rooms per household
%     - AveBedrms     average number of bedrooms per household
%     - Population    block group population
%     - AveOccup      average number of household members
%     - Latitude      block group latitude
%     - Longitude     block group longitude
%
% :Missing Attribute Values: None
%
% This dataset was obtained from the StatLib repository.
% https://www.dcc.fc.up.pt/~ltorgo/Regression/cal_housing.html
%
% The target variable is the median house value for California districts,
% expressed in hundreds of thousands of dollars ($100,000).
%
% This dataset was derived from the 1990 U.S. census, using one row per census
% block group. A block group is the smallest geographical unit for which the U.S.
% Census Bureau publishes sample data (a block group typically has a population
% of 600 to 3,000 people).
%
% A household is a group of people residing within a home. Since the average
% number of rooms and bedrooms in this dataset are provided per household, these
% columns may take surprisingly large values for block groups with few households
% and many empty houses, such as vacation resorts.
%
% It can be downloaded/loaded using the
% :func:`sklearn.datasets.fetch_california_housing` function.
%
% .. topic:: References
%
%     - Pace, R. Kelley and Ronald Barry, Sparse Spatial Autoregressions,
%       Statistics and Probability Letters, 33 (1997) 291-297
%%%
%选择收入中位数（MedInc）或其他特征作为预测变量，选择数据房价中位数(MedHouseValue)作为响应变量

%% 数据预处理并可视化
% 注意：数据集可能存在数据分布不均匀，有离群值等问题
%% 划分数据集，确保有20%的数据用于测试

%% 选择合适的方法训练回归模型

%% 评估模型预测性能



