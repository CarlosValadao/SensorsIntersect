function plotSensors(sensorsCellArray, sensorsAmount, showSensorID)
    if sensorsAmount > 0
        for k=1:sensorsAmount
            plotSensor(sensorsCellArray(k), k, showSensorID);
        end
    else
        error("ARRAY DE SENSORES VAZIO");
    end
end