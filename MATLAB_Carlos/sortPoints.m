% Ordena dois pontos, [x1 y1] e [x2 y2] com ordem de procedencia
% primeiro em x e depois em y, x tem procedencia sobre y
% devolve os pontos ordenados, o menor em minor e o maior em
% bigger

function [minor, bigger] = sortPoints(p1, p2)
    points = [p1; p2];
    sortedPoints = sortrows(points);
    minor = sortedPoints(1,:);
    bigger = sortedPoints(2,:);
end