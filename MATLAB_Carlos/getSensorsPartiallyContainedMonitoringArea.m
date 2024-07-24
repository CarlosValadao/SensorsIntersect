% Essa funcao recebe o array que guarda todos os sensores
% e devolve o índice dos sensores que estao parcialmente contidos
% na area de interese, baseado no array original, bem os sensores que estao
% parcialmente na area de interesse

function [sensorsPartiallyContained, sensorsPartiallyContainedIdx] = getSensorsPartiallyContainedMonitoringArea ...
                                                                    (sensors, quantitySensors, monitoringArea)
    sensorsIndex = 1:quantitySensors;
    [sensorsOut, sensorsOutIndex] = getSensorsOutMonitoringArea(sensors, monitoringArea);
    [sensorsIn, sensorsInIndex] = getSensorsInMonitoringArea(sensors, monitoringArea);
    % Pode ocorrer a repeticao de pontos
    
    sensorsTotallyInAndOutIndex = union(sensorsOutIndex, sensorsInIndex);
    sensorsPartiallyContainedIndex = setdiff(sensorsIndex, sensorsTotallyInAndOutIndex);
    sensorsPartiallyContained = sensors(sensorsPartiallyContainedIndex);
    sensorsPartiallyContainedIdx = sensorsPartiallyContainedIndex;
end
