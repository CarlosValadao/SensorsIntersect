clc
A = [randi(10, 1), randi(10, 1)];
B = [randi(10, 1), randi(10, 1)];
C = [randi(10, 1), randi(10, 1)];
D = [randi(10, 1), randi(10, 1)];
% x = pointInSegment(A, B, P);
% y = pointInSegment(C, D, P);
hold on
axis([0 15 0 15]);
plot(getxcoord(A, B), getycoord(A, B), 'r-o');
plot(getxcoord(C, D), getycoord(C, D), 'g-o');
[h, x, y] = getSegmentsIntersection(A, B, C, D);
% x
% y
% P
% length(P)
plot(x, y, 'bs', 'LineWidth', 2);