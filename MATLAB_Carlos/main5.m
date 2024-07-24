clc
A = [3, 3];
B = [3, 10];
C = [-1, 1];
D = [10, 23];
% m = MonitoringArea(0, 5, 10, 5, 0);
s3 = Segment([0,4], [6, 4], true);
s1 = Segment(A, B, false);
s2 = Segment(C, D, true);
% [h, x, y] = getSegmentsIntersection(s1, s2);
[h, x, y] = getSegmentsIntersection(s2, s3);
