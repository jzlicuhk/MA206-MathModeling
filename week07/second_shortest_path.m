function [p1,p2,d1,d2] = second_shortest_path(G,s,t)

[p1,d1] = shortestpath(G,s,t);
n = length(p1);
d2 = inf;
for i = 1:(n-1)
    A = adjacency(G,"weighted");
    A = full(A);
    A(p1(i),p1(i+1)) = inf;
    A(p1(i+1),p1(i)) = inf;
    [m1,d] = shortestpath(digraph(A),s,t);
    if d<d2
        d2 = d;
        p2 = m1;
    end
end