% Essa funcao remove todos os sensores que estao completamente
% fora da area de interesse, do array de sensores, e retorna
% um novo array com os sensores que estao completamente contidos
% na area de interesse ou parcialmente contidos na area de interesse

% sensors e o array que contem os sensores, enquanto monitoringArea representa
% a area de interesse e sensorsIn sao os sensores que nao estao totalmente fora da area
% de interesse, repito, NAO ESTAO TOTALMENTE FORA DA AREA DE INTERESSE

function sensorsIn = removeSensorsOutsideMonitoringArea(sensors, quantitySensors, monitoringArea)
    [sensorsOut, sensorsOutInIndex] = getSensorsOutMonitoringArea(sensors, monitoringArea);
    sensorsIndex = 1:quantitySensors;
    sensorsInIndex = setdiff(sensorsIndex, sensorsOutInIndex);
    sensorsIn = sensors(sensorsInIndex);
end

