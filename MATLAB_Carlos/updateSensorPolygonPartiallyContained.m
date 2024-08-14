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
function [sensorsUpToDate, xi, yi] = updateSensorPolygonPartiallyContained(sensors, sensorsIdxPartiallyContained, monitoringArea)
    polyshapeMonitoringArea = planarPolygon2Polyshape(monitoringArea);
    sizeSensors = length(sensorsIdxPartiallyContained);
    xi = zeros(1, 2*sizeSensors);
    yi = zeros(1, 2*sizeSensors);
    counter = 1;
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
            newPolygon = polyshape2PlanarPolygon(sensorIntersect);
            sensors(k) = newPolygon;
        end
        % Identificando os pontos de intersecao
        xCoordCurrentSensor = currentSensor.getXPointCoords();
        yCoordCurrentSensor = currentSensor.getYPointCoords();
        xCoordIntersectPolygon = verticesSensorIntersect(:,1);
        yCoordIntersectPolygon = verticesSensorIntersect(:,2);
        xCoordIntersectionPoints = setdiffWithRepetition(xCoordIntersectPolygon', xCoordCurrentSensor);
        yCoordIntersectionPoints = setdiffWithRepetition(yCoordIntersectPolygon', yCoordCurrentSensor);
        % xi = horzcat(xi, xCoordIntersectionPoints);
        % yi = horzcat(yi, yCoordIntersectionPoints);
        % Levando em consideracao que uma reta intersecta
        % um poligono nao convexo em apenas dois pontos
        % logo o vetor de intersecao tera sempre apenas
        % dois pontos
        % xCoordIntersectPolygon
        % yCoordIntersectPolygon
        % xCoordCurrentSensor
        % yCoordCurrentSensor
        % xCoordIntersectionPoints
        % yCoordIntersectionPoints
        xi(counter) = xCoordIntersectionPoints(1);
        xi(counter+1) = xCoordIntersectionPoints(2);
        yi(counter) = yCoordIntersectionPoints(1);
        yi(counter+1) = yCoordIntersectionPoints(2);
        counter = counter + 1;
    end
    sensorsUpToDate = sensors;
end