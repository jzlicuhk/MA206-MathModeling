%% 基于求解器的混合整数线性规划
clc;clear;close all
% 成本系数
f = [350*5,330*3,310*4,280*6,500,450,400,100];
% 整数系数
intcon = 1:4;
% 不等式约束
A = [];
b = [];
% 等式约束
Aeq = [5,3,4,6,1,1,1,1;
    5*0.05,3*0.04,4*0.05,6*0.03,0.08,0.07,0.06,0.03;
    5*0.03,3*0.03,4*0.04,6*0.04,0.06,0.07,0.08,0.09];
beq = [25;1.25;1.25];
% 变量的上下界
lb = zeros(8,1);
ub = ones(8,1);
ub(5:end) = Inf;
% 调用求解器
[x,fval] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);

x,fval
%% 
clc
intcon = [];
[x,fval] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
x,fval
%% 基于问题的混合整数线性规划
clc;clear;close all

% 创建优化对象
problem = optimproblem;
%% 
% 创建变量
ingots = optimvar('ingnots',4,'Type','integer','LowerBound',0,'UpperBound',1);
alloys = optimvar('alloys',3,'LowerBound',0);
scrap = optimvar('scrap','LowerBound',0);
%% 

% 创建成本表达式
ingots_weight = [5,3,4,6];
ingots_cost = ingots_weight.*[350,330,310,280];
alloys_cost = [500,450,400];
scrap_cost = 100;
cost = ingots_cost*ingots + alloys_cost*alloys + scrap*scrap_cost;

% 将成本作为目标函数
problem.Objective = cost;

% 等式约束 1，总重量为25吨
total_weight = ingots_weight*ingots + sum(alloys) + scrap;
% 等式约束 2，碳的重量为1.25吨
ingots_c = [5,4,5,3]/100;
alloys_c = [8,7,6]/100;
scrap_c = 3/100;
total_c = (ingots_weight.*ingots_c)*ingots + alloys_c*alloys + scrap_c*scrap;
% 等式约束 3 钼的重量为1.25吨
ingots_m = [3,3,4,4]/100;
alloys_m = [6,7,8]/100;
scrap_m = 9/100;
total_m = (ingots_weight.*ingots_m)*ingots + alloys_m*alloys + scrap_m*scrap;

% 在优化问题中加入约束
problem.Constraints.cons1 = total_weight == 25;
problem.Constraints.cons2 = total_c == 1.25;
problem.Constraints.cons3 = total_m == 1.25;

% 求解优化问题
[sol,fval] = solve(problem);
%查看问题与解
showproblem(problem)
sol.alloys
sol.ingnots
sol.scrap
fval