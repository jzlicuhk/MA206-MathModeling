clc;clear;close all

function dydt = dstate(t,y)
    alpha = 2; gamma = 0.0001;
    dydt = alpha*y - gamma*y^2;

end

ode = @(t,y) 2*y - 0.0001*y^2;

% 设置所要求的时间域
tspan = [0,9];
% 设置初始条件
y0 = 10;
% 使用ode45求解
[t1, y1] = ode45(@dstate, tspan, y0);
[t2,y2] = ode45(ode,tspan,y0);
% 可视化与输出
subplot(1,2,1)
plot(t1,y1)
subplot(1,2,2)
plot(t2,y2)

disp([t1,y1])



%% 
clc;clear;close all

function dydt = osc(t,y)
    dydt = zeros(2,1);
    dydt(1) = y(2);
    dydt(2) = 1000*(1-y(1)^2)*y(2) - y(1);
end

tspan = [0 3000];
y1_0 = 2;
y2_0 = 0;
[T,Y] = ode15s(@osc,tspan,[y1_0 y2_0]);
subplot(1,2,1)
plot(T,Y(:,1),'o')
subplot(1,2,2)
plot(Y(:,1),Y(:,2),'o')

%% 
clc;clear;close all
function dzdt = pend(t,z)
    G = 9.8;
    L = 2;
    z1 = z(1);
    z2 = z(2);
    dzdt = [z2 ; -G/L*sin(z1);];
end 
tspan=[0 2*pi];
z0=[pi/3,0]; 
[t,z]=ode23(@pend,tspan,z0);
plot(t,z(:,1))
%% 使用odeToVectorField
clc;clear;close all
% 定义 z 为 t 的符号函数
syms z(t)
G = 9.8;
L = 2;
% 定义二阶ODE
eqn = diff(z,t,2) == -G/L*sin(z(t));
% 转换为一阶系统
V = odeToVectorField(eqn);
% 将符号系统转换为MATLAB函数句柄
% 'Y' 必须大写，以匹配 odeToVectorField 的输出约定
odefun = matlabFunction(V, 'vars', {'t','Y'}); 

tspan=[0 2*pi];
z0=[pi/3,0]; 
[t,z]=ode23(odefun,tspan,z0);
plot(t,z(:,1))
%% 向ODE函数传参
clc;clear;close all
function dzdt = pend_param(t,z,G,L)

    z1 = z(1);
    z2 = z(2);
    dzdt = [z2 ; -G/L*sin(z1);];
end 

G = 9.8;
L = 2;

tspan=[0 2*pi];
z0=[pi/3,0]; 
[t,z]=ode45(@(t,z) pend_param(t,z,G,L),tspan,z0);
plot(t,z(:,1))



%% 课堂练习
% 模型：mx'' + cx' + kx = 0
% 通过改变阻尼系数 c (同时保持 m 和 k 不变)，
% 模拟并比较欠阻尼 (c^2<4mk)、临界阻尼 (c^2=4mk) 和过阻尼 (c^2>4mk) 三种情况下的位移 x(t)。
% 绘制它们的相图。