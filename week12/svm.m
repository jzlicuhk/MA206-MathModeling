
clc;clear;close all
% 加载数据
data = readmatrix('spiral.csv');
x = data(:, 1:2);
y = data(:, 3);

% 绘制原始数据点
figure;
hold on;
scatter(x(y==-1,1), x(y==-1,2), 'r', 'DisplayName', 'y = -1');
scatter(x(y==1,1), x(y==1,2), 'bx', 'DisplayName', 'y = 1');
xlabel('$x_1$', 'Interpreter', 'latex');
ylabel('$x_2$', 'Interpreter', 'latex');
legend;
axis square;
hold off;
%% 

% 训练 SVM 模型
model = fitcsvm(x, y, 'KernelFunction', 'rbf', 'KernelScale', 1/sqrt(50));

[x1Grid, x2Grid] = meshgrid(linspace(-1.5, 1.5, 100), linspace(-1.5, 1.5, 100));
xGrid = [x1Grid(:), x2Grid(:)];

% 预测
[label, ~] = predict(model, xGrid);
labelGrid = reshape(label, size(x1Grid));
%% 

% 绘制分类区域
figure;
contourf(x1Grid, x2Grid, labelGrid, 'LineColor', 'none');
colormap([1 0.5 0.4; 0.2549 0.4118 0.8824]);

hold on;
scatter(x(y==-1,1), x(y==-1,2), 'r', 'DisplayName', 'y = -1');
scatter(x(y==1,1), x(y==1,2), 'bx', 'DisplayName', 'y = 1');
xlabel('$x_1$', 'Interpreter', 'latex');
ylabel('$x_2$', 'Interpreter', 'latex');
legend;
hold off;