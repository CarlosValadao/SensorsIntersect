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

% Aqui nessa funcao que sera feita a verificacao se a intersecao entre os
% segmentos de reta sao paralelo ao eixo y, ambos ou um deles =, dessa
% forma 


% getSegmentsIntersectionLE -> LE de line Equations, denota que as equacoes de reta
% ja vem pronta, nao sao calculadas dentro da funcao

% r denotada por p1 e p2
% s denotada por q1 e q2

function [hasIntersection, x, y] = getSegmentsIntersectionLE(p1, p2, q1, q2, r, s)
    % r = [ ( (p1(2)-p2(2))/(p1(1)-p2(1)) ) ( p2(2)-(p2(1)*(p1(2)-p2(2))/(p1(1)-p2(1))) ) ];
    % s = [ ( (q1(2)-q2(2))/(q1(1)-q2(1)) ) ( q2(2)-(q2(1)*(q1(2)-q2(2))/(q1(1)-q2(1))) ) ];
    % r = getLineEquation(p1, p2);
    % s = getLineEquation(q1, q2);
    root = roots(r-s);
    if root
        x = root(1);
        y = polyval(r, x);
        interPoint = [x y];
        % interPoint
        interInP1P2 = pointInSegment(p1, p2, interPoint);
        interInQ1Q2 = pointInSegment(q1, q2, interPoint);
        if interInP1P2 && interInQ1Q2
            hasIntersection = true;
            return;
        end
    end
    x = [];
    y = [];
    hasIntersection = false;
end