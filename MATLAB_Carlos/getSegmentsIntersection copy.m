% verifica se duas retas se intersectam, dadas as suas equacoes
% lineEq1 e lineEq2 respectivamente, arrays representando os coeficientes de
% um polinomio do primeiro grau a*x + b => [a b].
% isintersected = true se as duas retas se intersectam e false CC
% Dessa forma point, um vetor, tera coordenadas [x, y] caso isintersected = 1
% e [NaN, NaN] cc.

% p1 e p2 arrays que representam os
% pontos por onde lineEq1 passa, analogamente para q1, q2 e lineEq2
% p1 < p2 => dist(p1) < dist(p2), em relação à origem do sistema de coordenadas.

% Isso vai passar a se chamar getSegmentsIntersection, pois trataremos de segmentos
% de reta e não de retas em si

% Refazer os comentarios desta funcao
% Certamente o ponto de intersecao pertencera as duas retas, logo, para que a intersecao
% seja "valida" e preciso que o ponto P, da intersecao possua suas coordenadas x e y
% entre as cordenadas x e y dos dois pontos que determinam a equacao da reta lineEq1

% p1 e p2 são pontos coolineares e distintos por onde a reta r passa
% q1 e q2 são pontos coolineares e distintos por onde a reta s passa

function [hasIntersection, x, y] = getSegmentsIntersection(p1, p2, q1, q2)
    x = 0;
    y = 0;
    % root = roots(lineEq1-lineEq2);
    x1 = [ p1(1), p2(1), p1(1) ];
    y1 = [ p1(2), p2(2), p1(2) ];
    x2 = [ q1(1), q2(1), q1(1) ];
    y2 = [ q1(2), q2(2), q1(2) ];
    % x1
    % y1
    % x2
    % y2
    [x,y] = polyxpoly(x1, y1, x2, y2);
    % disp("GETSEGMENTE INTERSECTIONPOINT");
    if any(x) && any(y)
        % x
        % y
        hasIntersection = true;
        return;
    end
    hasIntersection = false;
end