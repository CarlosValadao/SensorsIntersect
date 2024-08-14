% Plota composta pelos sensores cujos os
% indices estao contidos sem sensorsIdx, e
% os respectivos sensores em sensors
% sensorsPaths e um array de celulas
% barrierNumber e um numero inteiro, e claro deve estar
% nos limites (boundies) de sensorsPaths, senao ocorrera um
% erro de indice fora do range
% sensors e o vetor que contem os sensores (array de PlanarPolygon)
function plotBarrier(sensorsPaths , barrierId, sensors, sizeSensorsPaths)
    sensorsIdx = sensorsPaths{barrierId};
    sizeBarrier = length(sensorsIdx) - 1;
    for k=2:sizeBarrier
        plotSensor(sensors(sensorsIdx(k)-1), sensorsIdx(k)-1, true);
    end
    customBarrierTitle = sprintf("Barreira n° %s de %s possíveis", ...
        num2str(barrierId), num2str(sizeSensorsPaths));
    title(customBarrierTitle);
end