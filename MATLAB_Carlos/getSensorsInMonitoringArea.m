% Recebe um array que contem todos os sensores e a area de monitoramento
% e devolve um array de celulas contendo apenas os sensores que estao
% totalmente contidos na area de monitoramento
function [sensorsIn, sensorsInOriginPositions] = getSensorsInMonitoringArea(sensors, monitoringArea)
    setSensorsInMonitoringArea = @(sensor) isSensorContainedInMonitoringArea(sensor, monitoringArea);
    sensorsAux = arrayfun(setSensorsInMonitoringArea, sensors);
    [sensorsIn, sensorsInOriginPositions] = fillCellVectorWithSelection(sensors, sensorsAux);
end