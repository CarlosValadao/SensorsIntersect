% Plota composta pelos sensores cujos os
% indices estao contidos sem sensorsIdx, e
% os respectivos sensores em sensors
function plotBarrier(sensorsIdx, sensors)
    figure
    hold on
    grid minor
    title("Barreira de Sensores");
    sizeBarrier = length(sensorsIdx) - 1;
    for k=2:sizeBarrier
        plotSensor(sensors(sensorsIdx(k)-1), sensorsIdx(k)-1, true);
    end

end