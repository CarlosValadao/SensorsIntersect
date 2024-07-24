% Calcula os pontos de intersecao entre um segmento de reta e um poligono
% Recebe o poligono e o segmento a serem computados
% Dois array contendo as coordenadas x e y dos pontos de intersecao
% entre o segmento de reta e o poligono

% side -> lado da area de monitoramento
% polygon -> poligono a ser comparado
% Devolve hasIntersection, indicando que o sensor
% esta contido 

function [contains] = sideMonitoringAreaIntersection(side, polygon)
    polygonSegments = polygon.getSegments();
    for polygonSegment=polygonSegments
        startPoint = polygonSegment.getStartPoint();
        endPoint = polygonSegment.getEndPoint();
        if isyconstfunc(startPoint, endPoint)
            hasIntersection = true;
            return;
        end
    end
    hasIntersection = false;
end
