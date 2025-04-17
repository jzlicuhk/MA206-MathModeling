%% Simple Example 
clc;clear;close all
rng default

func = @(x)[norm(x)^2,0.5*norm(x(:)-[2;-1])^2+2];

[x,fval] = gamultiobj(func,2);

plot(x(:,1),x(:,2),'ko')
xlabel('x(1)')
ylabel('x(2)')
title('Pareto Points in Parameter Space')
%% 加入线性约束
clc;close all

A = [1,1];
b = 1/2;

x = gamultiobj(func,2,A,b);

plot(x(:,1),x(:,2),'ko')
t = linspace(-1/2,2);
y = 1/2 - t;
hold on
plot(t,y,'b--')
xlabel('x(1)')
ylabel('x(2)')
title('Pareto Points in Parameter Space')
hold off
%% 使用 optimoptions 选择绘图函数
close all
% 绘制每代的帕累托前沿
options = optimoptions(@gamultiobj,'PlotFcn',@gaplotpareto);
gamultiobj(func,2,A,b,[],[],[],[],options)
%% 比较 paretosearch 和 gamultiobj
clc;clear;close all
rng default

nvars = 2;
opts = optimoptions(@gamultiobj,'UseVectorized',true);
[xga,fvalga,~,gaoutput] = gamultiobj(@(x)mymulti3(x),nvars,[],[],[],[],[],[],[],opts);

optsp = optimoptions('paretosearch','UseVectorized',true);
[xp,fvalp,~,psoutput] = paretosearch(@(x)mymulti3(x),nvars,[],[],[],[],[],[],[],optsp);

a = [fzero(@(t)mymulti4([t,-3.15]),[2,3]),-3.15];
for jj = linspace(-3.125,-1.89,50)
    a = [a;[fzero(@(t)mymulti4([t,jj]),[2,3]),jj]];
end

figure
plot(fvalp(:,1),fvalp(:,2),'bo');
hold on
fs = mymulti3(a);
plot(fvalga(:,1),fvalga(:,2),'r*');
plot(fs(:,1),fs(:,2),'k.')
legend('Paretosearch','Gamultiobj','True')
xlabel('Objective 1')
ylabel('Objective 2')
hold off

[x,y] = meshgrid(1.9:.01:3.1,-3.2:.01:-1.8);
mydata = mymulti3([x(:),y(:)]);
myff = sqrt(mydata(:,1) + 39);% Spaces the contours better
mygg = sqrt(mydata(:,2) + 28);% Spaces the contours better
myff = reshape(myff,size(x));
mygg = reshape(mygg,size(x));

figure;
hold on
contour(x,y,mygg,50)
contour(x,y,myff,50)
plot(xp(:,1),xp(:,2),'bo')
plot(xga(:,1),xga(:,2),'r*')
plot(a(:,1),a(:,2),'-k')
xlabel('x(1)')
ylabel('x(2)')
hold off
%% 
clc;close all
% 添加平移
shift = [20,-30];
fun = @(x)mymulti3(x+shift);
opts.PopulationSize = 100; % opts.ParetoFraction = 35
[xgash,fvalgash,~,gashoutput] = gamultiobj(fun,nvars,[],[],[],[],[],[],opts);

optsp.PlotFcn = [];
optsp.ParetoSetSize = 35;
[xpsh,fvalpsh,~,pshoutput] = paretosearch(fun,nvars,[],[],[],[],[],[],[],optsp);

figure
plot(fvalpsh(:,1),fvalpsh(:,2),'bo');
hold on
plot(fs(:,1),fs(:,2),'k.')
legend('Paretosearch','True')
xlabel('Objective 1')
ylabel('Objective 2')
hold off
