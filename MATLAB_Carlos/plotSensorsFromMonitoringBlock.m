% Plota os sensores contidos em
% sensors, com base nos blocos
% de cobertura, dispostos na area
% de monitoramento, composta por
% um conjunto de MonitoringBlocks
function plotSensorsFromMonitoringBlock(sensors)
    for sensor=sensors
        plotSensorFromMonitoringBlock(sensor);
    end
end