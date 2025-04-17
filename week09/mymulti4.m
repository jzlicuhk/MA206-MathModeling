function mout = mymulti4(x)
% 计算帕累托前沿上理论上精确的点
gg = [4*x(1)^3+x(2)-2*x(1)*(x(2)^2) - 18*x(1);
    x(1)+4*x(2)^3-2*(x(1)^2)*x(2)];
gf = gg + [18*x(1);9*x(2)^2];

mout = gf(1)*gg(2) - gf(2)*gg(1);
end