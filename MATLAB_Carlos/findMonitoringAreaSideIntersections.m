% Essa funcao recebe a area de monitoramento - monitoringArea - e o array
% que guarda todos os sensores - sensors - e retorna um array contendo as
% posicoes dos sensores, no array sensors, que intersectam com o lado
% da area de monitoramento ou segmento
% Bem como os pontos de intersecao que cada sensor obteve com a reta,
% uma vez que uma reta intersecta em apenas dois pontos, um polígono convexo
% (polígono original de um sensor)
% xi - coordenadas x dos pontos de intersecao
% yi - coordenadas y dos pontos de intersecao
function [IdxSensorsLeftSideInter, xi, yi] = findMonitoringAreaSideIntersections(monitoringAreaSide, sensors)
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