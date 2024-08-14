% Esta funcao recebe um array de polygonos
% e calcula a intersecao entre eles, de par
% em par, partindo do inicio
% Devolve as coordenadas do poligono resultante
function [unionPolyshapePolygon] = growingPoly(sensorsIdx, sensors)
    unionPolyshapePolygon = planarPolygon2Polyshape(sensors(sensorsIdx(2)-1));
    lengthSensorArray = length(sensorsIdx)-1;
    for k = 3:lengthSensorArray
        sensorPolyShape = planarPolygon2Polyshape(sensors(sensorsIdx(k)-1));
        unionPolyshapePolygon = union(unionPolyshapePolygon, sensorPolyShape);
    end
end