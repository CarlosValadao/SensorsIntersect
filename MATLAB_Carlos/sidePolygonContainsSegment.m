% Verifica se um dado lado de um poligono - polygon - esta
% contido em um um dado segmento de reta - segment - caso contenha, 
% retorna verdadeiro e os pontos que determinam o lado do poligono
% startPoint e endPoint que determinam o lado do poligono
% que esta contido no segmento de reta

function [contains, xi, yi ] = sidePolygonContainsSegment(segment, polygon)
    polygonSides = polygon.getSegments();
    
end