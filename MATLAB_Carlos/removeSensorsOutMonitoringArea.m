% Essa funcao recebe um array de celula que contem Sensor, sensores
% e um MonitoringArea, area de monitoramento.
% Altera diretamente o array <sensors> removendo os sensores do 
% array que estao totalmente fora da area de interesse
% Isto e: os 3 pontos que compoem o sensor
% Conservando a ordem, claro

function sensorsInMonitoringArea = removeSensorsOutMonitoringArea(sensors, monitoringArea)
    sensorsLength = length(sensors);
    counter = 1;
    for k = 1:3
        if isSensorTotallyOutMonitoringArea(sensors{k}, monitoringArea)
            sensors(k) = [];
        end
    end

end