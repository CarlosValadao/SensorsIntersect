% Esta funcao recebe um array de polygonos
% e calcula a intersecao entre eles, de par
% em par, partindo do inicio
% Devolve as coordenadas do poligono resultante
function [ps] = growingPoly(sensorsIdx, sensors)
    polyShapeUnion = planarPolygon2Polyshape(sensors(sensorsIdx(2)-1));
    lengthSensorArray = length(sensorsIdx)-1;
    for k = 3:lengthSensorArray
        sensorPolyShape = planarPolygon2Polyshape(sensors(sensorsIdx(k)-1));
        polyShapeUnion = union(polyShapeUnion, sensorPolyShape);
    end
    ps = polyshape2PlanarPolygon(polyShapeUnion);
    figure
    hold on
    grid minor
    plot(polyShapeUnion);
    vertices = polyShapeUnion.Vertices;
    xv = vertices(:,1);
    yv = vertices(:,2);
    figure
    hold on
    grid minor
    plot(xv, yv);
    title("Plot usando as coordenadas obtidas em .Vertices");
end