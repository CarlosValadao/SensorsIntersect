function [yes] = isxconstfunc(p1, p2)
    yes = p1(2) == p2(2) && p1(1) ~= p2(1);