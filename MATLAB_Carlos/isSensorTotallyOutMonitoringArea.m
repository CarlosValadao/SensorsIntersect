% Verifica se um sensor esta totalmente fora de uma area
% de interesse determinada por um poligono que segue
% os pontos contidos xcoords e ycoords

% Assume que os pontos estao em ordem horaria ou anti-horaria
% (pontos que determinam o poligono)

% Caso os 3 pontos nao estejam fora da area de interesse, entao
% o sensor esta parcialmente contido na area de interesse ou totalmente
% contido na area de interesse

function [out] = isSensorTotallyOutMonitoringArea(sensor, monitoringArea)
    sensorVertices = sensor.getVertices();
    sensorNVertices = sensor.getNVertices();
    for k=1:sensorNVertices
        sensorVertex = sensorVertices{k};
        if monitoringArea.isinside(sensorVertex)
            out = false;
            return;
        end
    end
    % Significa que passou por todo o for e que nenhum vertice do sensor esta
    % contido na area de interesse, entao o sensor esta totalmente fora dela
    out = true;
    % ASensorPoint = sensor.getAPoint();
    % BSensorPoint = sensor.getBPoint();
    % CSensorPoint = sensor.getCPoint();
    % MAxcoords = monitoringArea.getXPointCoords();
    % MAycoords = monitoringArea.getYPointCoords();
    % APointOutside = ~inpolygon(ASensorPoint(1), ASensorPoint(2), MAxcoords, MAycoords);
    % BPointOutside = ~inpolygon(BSensorPoint(1), BSensorPoint(2), MAxcoords, MAycoords);
    % CPointOutside = ~inpolygon(CSensorPoint(1), CSensorPoint(2), MAxcoords, MAycoords);
    % out = APointOutside && BPointOutside && CPointOutside;
end