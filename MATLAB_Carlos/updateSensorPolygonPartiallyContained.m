% Atualiza o novo poligono gerado a partir da intersecao
% entre um sensor parcialmente contido na area de interesse e a area
% de interesse no array que guarda todos os sensores, e o retorna
% - > Recebe o array que guarda todos os sensores - sensors -, o array
% que guarda o índice dos sensores parcialmente contidos na area de interesse,
% em relação a - sensors -, - sensorsIdxPartiallyContained - e a area de monitoramento
% que assim como o sensor e um poligono.
%  -> Devolve o novo array de sensores, com os poligonos atualizados
% xi - Conjunto de coordenadas x dos pontos de intersecao
% yi - Conjunto de coordenadas y dos pontos de intersecao

% sensorsu = sensors updated
function [sensorsUpToDate] = updateSensorPolygonPartiallyContained(sensors, sensorsIdxPartiallyContained, monitoringArea)
    polyshapeMonitoringArea = planarPolygon2Polyshape(monitoringArea);
    % xi = [];
    % yi = [];
    for k=sensorsIdxPartiallyContained
        % [hasInter, newPolygon] = interPolygon(sensors(k), monitoringArea);
        currentSensor = sensors(k);
        currentPolyshapeSensor = planarPolygon2Polyshape(currentSensor);
        sensorIntersect = intersect(currentPolyshapeSensor, polyshapeMonitoringArea);
        verticesSensorIntersect = sensorIntersect.Vertices;
        hasInter = ~isempty(verticesSensorIntersect);
        if hasInter
            % newPolygon = polyshape2PlanarPolygon(sensorIntersect);
            % polyshapePolygonVertices = sensorIntersect.Vertices;
            sizePolyshapeUnionVertices = size(verticesSensorIntersect, 1);
            polyshapePolygonPoints = mat2cell(verticesSensorIntersect, ...
                                     ones(sizePolyshapeUnionVertices, 1), 2);
            updateSensorFoVLevels(sensorIntersect, sensors(k));
            sensors(k).renew(polyshapePolygonPoints{:});
            % sensors(k) = newPolygon;
        end
    end
    sensorsUpToDate = sensors;
end