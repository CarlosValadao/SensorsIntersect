% Verifica se todos os pontos do sensor estao contidos na area de interesse
% caso estejam contains assume true, contains assume false caso contrario
function contains = isSensorContainedInMonitoringArea(sensor, monitoringArea)
    sensorVertices = sensor.getVertices();
    sensorNVertices = sensor.getNVertices();
    for k=1:sensorNVertices
        sensorVertex = sensorVertices{k};
        if monitoringArea.isoutside(sensorVertex)
            contains = false;
            return;
        end
    end
    contains = true;
end