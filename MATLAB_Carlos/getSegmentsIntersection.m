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

function [hasIntersection, x, y] = getSegmentsIntersection(segment1, segment2)
    % r = [ ( (p1(2)-p2(2))/(p1(1)-p2(1)) ) ( p2(2)-(p2(1)*(p1(2)-p2(2))/(p1(1)-p2(1))) ) ];
    % s = [ ( (q1(2)-q2(2))/(q1(1)-q2(1)) ) ( q2(2)-(q2(1)*(q1(2)-q2(2))/(q1(1)-q2(1))) ) ];
    % r = getLineEquation(segment1.getStartPoint(), segment1.getEndPoint());
    % s = getLineEquation(segment2.getStartPoint(), segment2.getEndPoint());
    % hasIntersection = false;
    hasSegmentYDependent = false;
    % x = [];
    % y = [];
    if segment1.isYDependent() && segment2.isXDependent()
        r = inverseLinearFunction(segment2.getLineEquation(), segment2.isXDependent());
        s = segment1.getLineEquation();
        hasSegmentYDependent = true;
    elseif segment2.isYDependent() && segment1.isXDependent()
        r = segment2.getLineEquation();
        s = inverseLinearFunction(segment1.getLineEquation(), segment1.isXDependent());
        hasSegmentYDependent = true;
    elseif segment1.contains(segment2.getStartPoint) && segment1.contains(segment2.getEndPoint)
        hasIntersection = true;
        x = segment2.getXCoords();
        y = segment2.getYCoords();
        fprintf("EM SEGMENT INTERSECTION\n");
        x
        y
        return;
    elseif segment1.isYDependent() && segment2.isYDependent()
        % error("DOIS SEGMENTOS PARALELOS A Y ALGO DE ERRADO ACONTECEU");
        fprintf("SEGMENTOS PARALELOS E DISTINTOS, NAO CONTIDOS\n");
        hasIntersection = false;
        x = [];
        y = [];
        return;
    else
        r = segment1.getLineEquation();
        s = segment2.getLineEquation();
    end 
    root = roots(r-s);
    if root
        x = root(1);
        y = polyval(r, x);
        % De acordo com a propriedade das funcoes, se (x, y) pertence a f-1(x)
        % entao (y, x) pertence a f(x)
        if hasSegmentYDependent
            interPoint = [y x];
            [y, x] = deal(x, y);
        else
            interPoint = [x y];
        end
        % interPoint
        % interInP1P2 = pointInSegment(segment1.getStartPoint(), segment1.getEndPoint(), interPoint);
        % interInQ1Q2 = pointInSegment(segment2.getStartPoint(), segment2.getEndPoint(), interPoint);
        hasSegment1Interpoint = segment1.contains(interPoint);
        hasSegment2Interpoint = segment2.contains(interPoint);
        if hasSegment1Interpoint && hasSegment2Interpoint
            hasIntersection = true;
        else
            hasIntersection = false;
            x = [];
            y = [];
        end
    else
        fprintf("AS RETAS SAO PARALELAS!\n");
        hasIntersection = false;
        x = [];
        y = [];
    end
    x
    y
    hasIntersection
end