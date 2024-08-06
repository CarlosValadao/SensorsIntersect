% Realiza a intersecao entre um dado segmento - segment -
% e um sensor - sensor -, e devolve os pontos de intersecao
% entre todos os lados (segmentos do sensor) e o segmento dado
% (segment), e se existe intersecao
% Uma vez que um segmento interseca um poligono convexo em apenas
% dois pontos, ao encontrar uma intersecao a funcao e interrompida
% e os pontos de intersecao retornados, ou seja, de forma singela
% a funcao retorna a primeira ocorrencia de intersecao entre um
% segmento e um dado segmento de um sensor
function [hi, xi, yi] = intersectSegmentWithSensor(segment, sensor)
    % sensorSides = sensor.getSegments();
    % for sensorSide=sensorSides
    %     [hi, xi, yi] = getSegmentsIntersection(segment, sensorSide{1});
    %     if hi
    %         return;
    %     end
    % end
    xCoordSensor = sensor.getXPointCoordsLF;
    yCoordSensor = sensor.getYPointCoordsLF;
    xCoordsSegment = segment.getXCoords;
    yCoordSegment = segment.getYCoords;
    [xi, yi] = polyxpoly(xCoordsSegment, yCoordSegment, xCoordSensor, yCoordSensor);
    hi = ~isempty(xi) && ~isempty(yi);
end