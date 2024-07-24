function [hasIntersection, xIntersection, yIntersection] = getFullPlanarPolygonIntersection(polygon1, polygon2)
    p1XVertices = polygon1.getXPointCoordsLF();
    p1YVertices = polygon1.getYPointCoordsLF();
    p2XVertices = polygon2.getXPointCoordsLF();
    p2YVertices = polygon2.getYPointCoordsLF();
    [xIntersection, yIntersection] = polyxpoly(p1XVertices, p1YVertices, p2XVertices, p2YVertices, 'unique');
    [xContained, yContained] = findContainedVertices(polygon1, polygon2);
    % o operador [ x y ] concatena os vetores x e y de forma horizontal
    xIntersection = [xIntersection', xContained];
    yIntersection = [yIntersection' yContained];
    [xContained, yContained] = findContainedVertices(polygon2, polygon1);
    xIntersection = [xIntersection, xContained];
    yIntersection = [yIntersection yContained];
    hasIntersection = ~isempty(xIntersection) && ~isempty(yIntersection);
end