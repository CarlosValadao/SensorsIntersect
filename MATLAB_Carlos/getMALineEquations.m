% Recebe um array com as coordenadas que formam o retangulo e retorna
% as 4 equacoes de reta possiveis, A=1, B=2, C=3 e D=4, onde 1,2,3 e 4 são os
% pontos que determinam o retangulo e por consequencia as 4 retas

% Onde => 
% Os vetores virao da seguinte forma:
% xcoords = [ x(1) x(2) x(3) x(4) ]
% ycoords = [ y(1) y(2) y(3) y(4) ]

% Devera ser mudado para

% xcoords = [ x(1) x(2) x(4) x(3) ]
% ycoords = [ y(1) y(2) y(4) y(3) ]
% 

% As funcoes cuja as retas sao paralelas ao eixo x
% sao dadas em funcao de x (f(x)), enquanto as retas que sao
% paralelas ao eixo y sao dadas em funcao de y (f(y))

%(1)-> p1p2
%(2)-> p2p4
%(3)-> p3p4
%(4)-> p3p1
function [equations] = getMALineEquations(xCoordsMA, yCoordsMA)
    equations = cell(1, 4);
    MAPoints = joinXYCoordinates(xCoordsMA, yCoordsMA);
    [p1, p2, p3, p4] = MAPoints{:};
    equations{1} = getLineEquation(p1, p2);
    equations{2} = getLineEquation(p2, p4);
    equations{3} = getLineEquation(p3, p4);
    equations{4} = getLineEquation(p3, p1);
end
