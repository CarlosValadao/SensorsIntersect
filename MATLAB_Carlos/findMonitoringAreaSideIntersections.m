% Essa funcao recebe a area de monitoramento - monitoringArea - e o array
% que guarda todos os sensores - sensors - e retorna um array contendo as
% posicoes dos sensores, no array sensors, que intersectam com o lado
% esquerdo da area de monitoramento

function IdxSensorsLeftSideInter = findMonitoringAreaSideIntersections(monitoringAreaSide, sensors)
    sensorsSize = length(sensors);
    counter = 0;
    IdxSensorsLeftSideInter = uint8(1:sensorsSize);
    for k=1:sensorsSize
        [hi, xi, yi] = intersectSegmentWithSensor(monitoringAreaSide, sensors(k));
        if ~hi
            IdxSensorsLeftSideInter(k-counter) = [];
            counter = counter + 1;
        end
    end
end