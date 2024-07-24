function [yes] = isyconstfunc(p1, p2)
    yes = p1(1) == p2(1) && p2(2) ~= p1(2);
end 