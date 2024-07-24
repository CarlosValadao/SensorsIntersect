% Recebe um triangulo Isosceles pois um sensor, de acordo com o artigo que
% o professor Thiago me forneceu e um triangulo isosceles, com um angulo
% POV definido por mim mesmo no codigo principal, isto e em main.m

% A funcao nao verifica se o poligono fornecido e um triangulo ou nao
% apenas calcula as coordenadas do ponto tomando como verdade que o
% poligono e um triangulo isosceles

% Calcula o baricentro de um triangulo isósceles
function [xBarycenter, yBarycenter] = calculateBarycenter(isoscelesTriangle)
    isoscelesTriangleXVertices = isoscelesTriangle.getXVertices();
    isoscelesTriangleYVertices = isoscelesTriangle.getYVertices();
    xBarycenter = sum(isoscelesTriangleXVertices) / 3;
    yBarycenter = sum(isoscelesTriangleYVertices) / 3;
end
