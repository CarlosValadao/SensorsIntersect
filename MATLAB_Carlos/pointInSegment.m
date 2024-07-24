function [in] = pointInSegment(A, B, P)
    if isyconstfunc(A, B)
        in = B(1) == P(1) && P(2) >= A(2) && P(2) <= B(2);
    elseif isxconstfunc(A, B)
        in = B(2) == P(2) && P(1) >= A(1) && P(2) <= B(1);
    else
        eps = 1e-5;
        tx = (P(1)-A(1))/(B(1)-A(1));
        ty = (P(2)-A(2))/(B(2)-A(2));
        abstxty = abs(tx-ty);
        if abstxty < eps
            in = tx >= 0 && tx <= 1;
        else
            in = false;
        end
    end
end
