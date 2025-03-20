clc;clear;close all
%% 使用 \ 运算符进行简单的线性回归

load accidents.mat
x = hwydata(:,14); % 州人口
y = hwydata(:,4); % 州事故数量
format long
% 添加常数列
X = [ones(length(x),1) x]; % 第一列全为1，表示截距项
b = X\y;
disp(b) % 回归系数
yCalc = X*b;
% 绘制关系图
scatter(x,y)
hold on
plot(x,yCalc,'--')
xlabel('州人口')
ylabel('各州的交通事故')
title('事故与人口之间的线性回归关系')
grid on 
% 计算R方
Rsq = 1 - sum((y - yCalc).^2)/sum((y - mean(y)).^2);
disp(Rsq)
%% 使用polyfit函数实现一元线性回归
clc;close all

p = polyfit(x,y,1);
disp(p)

y_fit = polyval(p,x);

scatter(x,y)
hold on;
plot(x, y_fit, 'r-', 'LineWidth', 2); % 拟合直线
hold off;
grid on;
xlabel('X');
ylabel('Y');
title('使用polyfit实现线性回归');
legend('原始数据', '拟合直线');
%% 使用fitlm函数实现线性回归
clc;clear;close all
% 加载数据集
data = readmatrix("diabetes_data.csv");
X = data(:,1);
y = data(:,2);
% 划分数据集
cv = cvpartition(length(X),'HoldOut',0.3);
trainIdx = training(cv);
testIdx = test(cv);
X_train = X(trainIdx, :);
y_train = y(trainIdx, :);
X_test = X(testIdx, :);
y_test = y(testIdx, :);

model = fitlm(X_train,y_train);
% model.Coefficients
% model.Rsquared
disp(model)

y_pred = predict(model,X_test);

scatter(X_test,y_test)
legend('测试集')
hold on
plot(model)
xlabel('X')
ylabel('y')
title('Linear Regression')
%% 多项式回归
clc;clear;close all
rng(42)
x = linspace(-10, 10, 50); % 生成自变量 x
y = 3*x.^3 - 5*x.^2 + 2*x + randn(size(x))*50;

degree = [1,3,20];
for i = 1:3
subplot(1,3,i)
% 计算多项式回归系数
p = polyfit(x, y, degree(i));

% 生成预测值
x_pred = linspace(min(x), max(x), 100); 
y_pred = polyval(p, x_pred); 


% 绘制原始数据点和拟合曲线
scatter(x, y, 'ro', 'filled'); 
hold on;
plot(x_pred, y_pred, 'b-', 'LineWidth', 2); 


xlabel('X 值');
ylabel('Y 值');
title(sprintf('阶数 = %d', degree(i)));
legend('原始数据', '拟合曲线');
grid on;
hold off;
end
%% 岭回归
clc;clear;close all
load carbig
X = [Acceleration Weight Displacement Horsepower];
y = MPG;
n = length(y);

rng('default')
c = cvpartition(n,'HoldOut',0.3);
idxTrain = training(c,1);
idxTest = ~idxTrain;

k = 5;
b = ridge(y(idxTrain),X(idxTrain,:),k,0);
yhat = b(1) + X(idxTest,:)*b(2:end);

scatter(y(idxTest),yhat)
hold on
plot(y(idxTest),y(idxTest))
xlabel('Actual MPG')
ylabel('Predicted MPG')
hold off
%% lasso回归实现变量选择
clc;clear;close all
rng default  
X = randn(100,5);
weights = [0;2;0;-3;0]; % 只有两个非零系数
y = X*weights + randn(100,1)*0.1; 
B = lasso(X,y);
B(:,25)
