clc
p1 = [1 3]
p2 = [2 5]
isyconstfunc(p1, p2)
plot(getxcoord(p1, p2), getycoord(p1, p2), 'r-s', 'LineWidth', 2);
axis([-1 3.5 1/2 5]);
hold on;