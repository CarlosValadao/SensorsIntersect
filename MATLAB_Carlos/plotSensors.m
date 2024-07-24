function plotSensors(sensorsCellArray, sensorsAmount)
    if sensorsAmount > 0
        for k=1:sensorsAmount
            plotSensor(sensorsCellArray(k), k);
        end
    else
        error("ARRAY DE SENSORES VAZIO");
    end
end