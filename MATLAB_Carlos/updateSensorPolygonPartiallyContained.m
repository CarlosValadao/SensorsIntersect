% Atualiza o novo poligono gerado a partir da intersecao
% entre um sensor parcialmente contido na area de interesse e a area
% de interesse no array que guarda todos os sensores, e o retorna
% - > Recebe o array que guarda todos os sensores - sensors -, o array
% que guarda o índice dos sensores parcialmente contidos na area de interesse,
% em relação a - sensors -, - sensorsIdxPartiallyContained - e a area de monitoramento
% que assim como o sensor e um poligono.
%  -> Devolve o novo array de sensores, com os poligonos atualizados

% sensorsu = sensors updated
function sensorsu = updateSensorPolygonPartiallyContained(sensors, sensorsIdxPartiallyContained, monitoringArea)
    polyshapeMonitoringArea = planarPolygon2Polyshape(monitoringArea);
    for k=sensorsIdxPartiallyContained
        % [hasInter, newPolygon] = interPolygon(sensors(k), monitoringArea);
        polyshapeSensor = planarPolygon2Polyshape(sensors(k));
        sensorIntersect = intersect(polyshapeSensor, polyshapeMonitoringArea);
        hasInter = ~isempty(sensorIntersect.Vertices);
        if hasInter
            newPolygon = polyshape2PlanarPolygon(sensorIntersect);
            sensors(k) = newPolygon;
        end
    end
    sensorsu = sensors;
end