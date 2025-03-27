%% interp1示例

clc;clear;close all
xi=0:pi/5:pi; 
yi=sin(xi);
xh=0:pi/30:pi;
yh=interp1(xi,yi,xh);

subplot(2,2,1)
plot(xi,yi,'.b', xh,yh,'s-');
title('分段线性插值')

subplot(2,2,2)
yh=interp1(xi,yi,xh,"nearest");
plot(xi,yi,'.b', xh,yh,'s-');
title('临近插值')

subplot(2,2,3)
yh=interp1(xi,yi,xh,'pchip');
plot(xi,yi,'.b', xh,yh,'s-');
title('三次Hermite插值')
subplot(2,2,4)
yh=interp1(xi,yi,xh,'spline');
plot(xi,yi,'.b', xh,yh,'s-');
title('三次样条插值')
%% spline示例
clc;clear;close all

xi=[27.7, 28, 29, 30]; %插值节点
yi=[4.1, 4.3, 4.1, 3.0]; %节点处的函数值
df0=3.0; dfn=-4.0; %边界条件
pp=spline(xi,[df0, yi, dfn]);
xh=27.7:0.1:30; % 需要插值的点
yh=ppval(pp,xh); % 通过插值求得的近似值
plot(xh,yh,'o-');
title('spline')
%% csape示例
clc;clear;close all
xi=[27.7, 28, 29, 30]; % 插值节点
yi=[4.1, 4.3, 4.1, 3.0]; % 节点处的函数值
df0=3.0; dfn=-4.0; % 边界条件
pp=csape(xi,[df0, yi, dfn]);
xh=27.7:0.1:30; % 需要插值的点
yh=fnval(pp,xh); % 通过插值求得的近似值
plot(xh,yh,'o-');
title('csape')
%% griddata示例
clc;clear;close all
% 对随机点采样
rng default
xy = -2.5 + 5*rand([200 2]);
x = xy(:,1);
y = xy(:,2);
v = x.*exp(-x.^2-y.^2);
% 定义插值网格
[xq,yq] = meshgrid(-2:.2:2, -2:.2:2);
vq = griddata(x,y,v,xq,yq);
% 绘制网格和点
mesh(xq,yq,vq)
hold on
plot3(x,y,v,"o")
xlim([-2.7 2.7])
ylim([-2.7 2.7])
