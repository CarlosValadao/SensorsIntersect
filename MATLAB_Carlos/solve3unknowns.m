function sol = solveUnknowns(mr, mv)
    % mr1 = mr;
    % mr2 = mr;
    % mr3 = mr;
    % mr4 = mr;
    % mr1(:,1) = mv
    % mr2(:,2) = mv
    % mr3(:,3) = mv
    % mr4(:,4) = mv
    % detmr = det(mr);
    % detmr1 = det(mr1);
    % detmr2 = det(mr2);
    % detmr3 = det(mr3);
    % detmr4 = det(mr4);
    % solution(1) = detmr1/detmr;
    % solution(2) = detmr2/detmr;
    % solution(3) = detmr3/detmr;
    % solution(4) = detmr4/detmr;
    mrSize = length(mr);
    sol = zeros(1, mrSize);
    detmr = det(mr);
    for k = 1:mrSize
        tempMr = mr;
        tempMr(:,k) = mv;
        detTempMr = det(tempMr);
        sol(k) = detTempMr/detmr;
    end
end
