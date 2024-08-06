% Verifica a interseção entre dois sensores e retorna o ponto onde eles
% se intersectaram, tomando como verdade que os sensores se intersectam
% em apenas um ponto
% point é um array que contém as coordenadas x e y do pontos de interseção
% de sensor1 com sensor2 => point = [x y]
% point é vazio [] caso os sensores não se intersectam
% hasSensorsIntersection é 1 caso haja uma interseção entre as retas
% que descrevem os sensores e 0 CC

% Um sensor possui o seguinte esqueleto
% -> (1) sensor.angle
% -> (2) sensor.POV
% -> (3) sensor.RS
% -> (4) sensor.Ax
% -> (5) sensor.Ay
% -> (6) sensor.Bx
% -> (7) sensor.By
% -> (8) sensor.Cx
% -> (9) sensor.Cy
% -> (10) sensor.dist
% -> (11) sensor.ABLineEq
% -> (12) sensor.ACLineEq
% -> (13) sensor.BCLineEq
% -> (14) sensor.ABSegment
% -> (15) sensor.ACSegment
% -> (16) sensor.BCSegment


% não imterrompe a execução da função ao encontrar a primeira interseção entre
% os segmentos de reta

function [hasIntersection, x, y] = getSensorsIntersection(sensor1, sensor2)
    polyshapeSensor1 = planarPolygon2Polyshape(sensor1);
    polyshapeSensor2 = planarPolygon2Polyshape(sensor2);
    sensorIntersect = intersect(polyshapeSensor1, polyshapeSensor2);
    sensorIntersectVertices = sensorIntersect.Vertices;
    hasIntersection = ~isempty(sensorIntersectVertices);
    x = sensorIntersectVertices(:,1);
    y = sensorIntersectVertices(:,2);
end

% x e y sairao como dosi vetores de celula 