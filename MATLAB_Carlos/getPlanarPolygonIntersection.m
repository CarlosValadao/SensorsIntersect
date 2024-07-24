function [hasIntersection, xIntersection, yIntersection] = getPlanarPolygonIntersection(polygon1, polygon2)
    [hasIntersection, xIntersection, yIntersection] = getSensorsIntersection(polygon1, polygon2);
    lengthXInter = length(xIntersection) + 1;
    polygon1NVertices = polygon1.getNvertices();
    polygon1Vertices = polygon1.getVertices();
    polygon2NVertices = polygon2.getNvertices();
    polygon2Vertices = polygon2.getVertices();
    % Faz a verificacao se existe algum vertice de um poligono dentro
    % de outro poligono, se sim, este vertice e retornado
    % (adicionado ao vetor que guarda as intersecoes)
    for k=1:polygon1NVertices
        polygon1Vertex = polygon1Vertices{k};
        pointInside = polygon2.isinside(polygon1Vertex);
        if pointInside
            xIntersection(lengthXInter) = polygon1Vertex(1);
            yIntersection(lengthXInter) = polygon1Vertex(2);
            lengthXInter = lengthXInter + 1;
        else
            fprintf("%s | ESTE PONTO ESTA FORA DO POLIGONO\n", num2str(polygon1Vertex));
        end
    end
    for l=1:polygon2NVertices
        polygon2Vertex = polygon2Vertices{k};
        pointInside = polygon1.isinside(polygon2Vertex);
        if pointInside
            xIntersection(lengthXInter) = polygon2Vertex(1);
            yIntersection(lengthXInter) = polygon2Vertex(2);
            lengthXInter = lengthXInter + 1;
        else
            fprintf("%s | ESTE PONTO ESTA FORA DO POLIGONO\n", num2str(polygon2Vertex));
        end
    end
end