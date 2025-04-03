%% 无向图
clc;clear;close all
s = {'A','A','B'};
t = {'B','C','C'};

G = graph(s,t);

plot(G)
title('无向图')
%% 有向图
clc;clear;close all
s = {'A','C','B'};
t = {'B','A','C'};

G = digraph(s,t);

plot(G)
title('有向图')

isdag(G)
%% 多重图
clc;clear;close all
s = {'A','A','A','A','A','A','A','B'};
t = {'A','A','A','B','B','B','C','C'};

G = graph(s,t);

plot(G)
title('多重图')

ismultigraph(G)
%% 修改图的节点
clc;clear;close all

G = graph([1 2 3],[2 3 4]);
subplot(1,4,1)
plot(G)

G = addnode(G,2);
subplot(1,4,2)
plot(G)

G.Nodes.Name = {'A' 'B' 'C' 'D' 'E' 'F'}';
subplot(1,4,3)
plot(G)

G = rmnode(G,'F');
subplot(1,4,4)
plot(G)

N = numnodes(G)
%% 修改图的边
clc;clear;close all

G = digraph([1 2 3],[2 3 4],[1,2,3]);
subplot(1,3,1)
plot(G,"EdgeLabel",G.Edges.Weight)

G = addedge(G,1,3,10);
subplot(1,3,2)
plot(G,"EdgeLabel",G.Edges.Weight)

G = flipedge(G);
subplot(1,3,3)
plot(G)


%% 使用邻接矩阵表示法创建图
clc;clear;close all
A = [0 1 1;1 0 1;1 1 0];
B = [1 0 1; 0 0 0;1 1 1];
node_name = {'A','B','C'};
G1 = graph(A,node_name);
G2 = digraph(B,node_name);
subplot(1,2,1)
plot(G1)
title('邻接矩阵表示法创建无向图')
subplot(1,2,2)
plot(G2)
title('邻接矩阵表示法创建有向图')

%% Dijkstra算法
clc;clear;close all

M = 10000;

a(1,:) = [0, 50, M, 40, 25, 10];
a(2,:) = [zeros(1,2), 15, 20, M, 25];
a(3,:) = [zeros(1,3), 10, 20, M];
a(4,:) = [zeros(1,4), 10, 25];
a(5,:) = [zeros(1,5), 55];
a(6,:) = zeros(1,6);

a = a + a';

G = graph(a);

plot(G,'EdgeLabel',G.Edges.Weight)

[d,index1,index2] = Dijkstra(a)

P = shortestpath(G,1,2,"Method","positive")


%% shortestpathtree函数
clc
[TR,D,E] = shortestpathtree(G,1)
p = plot(TR);
%% distances函数
d = distances(G)

%% 课堂练习
clc;clear;close all
w = [0 1 inf 2 inf 6;2 0 4 inf inf inf;inf 3 0 inf inf 2; inf 1 inf 0 3 inf;inf inf inf 2 0 1;inf inf 3 inf 1 0];
G = digraph(w);
plot(G,'EdgeLabel',G.Edges.Weight)
