% A funcao verifica quais vertices de polygon1 estao contidos em
% polygon2 e retorna estes vertices (pertencentes a polygon1, claro)
% em dois arrays
% Onde polyfonOrign e o poligono de origem, isto e, o poligono de onde os
% vertices serao tirados e polygonDest e o poligono de destino, isto e,
% o poligono onde os vertices extraidos serao verificados
function [xContainedVertices, yContainedVertices] = findContainedVertices(polygonOrign, polygonDest)
    idx = 1;
    xContainedVertices = [];
    yContainedVertices = [];
    polygonOrignVertices = polygonOrign.getVertices();
    polygonOrignNVertices = polygonOrign.getNVertices();
    for k=1:polygonOrignNVertices
        polygonOrignVertex = polygonOrignVertices{k};
        pointInside = polygonDest.isinside(polygonOrignVertex);
        if pointInside
            xContainedVertices(idx) = polygonOrignVertex(1);
            yContainedVertices(idx) = polygonOrignVertex(2);
            idx = idx + 1;
        end
    end
end