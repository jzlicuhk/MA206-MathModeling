function [d,index1,index2] = Dijkstra(a)
% 两点间最短路的Dijkstra算法
%   a 图的权值矩阵
%   d 所求最短路总和
%   index1 标号顶点顺序
%   index2 标号顶点索引

% 参数初始化
M = max(max(a));
pb(1:length(a)) = 0;
pb(1) = 1;
index1 = 1;
index2 = ones(1, length(a));
d(1:length(a)) = M; d(1) = 0; temp = 1;

% 更新 l(v), 同时记录顶点顺序和顶点索引
while sum(pb) < length(a)
    tb = find(pb == 0);
    d(tb) = min(d(tb), d(temp) + a(temp, tb));   % 更新 l(v)
    tmpb = find(d(tb) == min(d(tb)));
    temp = tb(tmpb(1));
    pb(temp) = 1;
    index1 = [index1, temp];                     % 记录标号顺序
    index = index1(find(d(index1) == d(temp) - a(temp, index1)));
    if length(index) >= 2
        index = index(1);
    end
    index2(temp) = index; % 记录标号索引
end
end