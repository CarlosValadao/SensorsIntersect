function sensorsPartiallyOut = removeSensorsContainedMonitoringArea(sensors, quantitySensors, monitoringArea)
    [containedSensors, containedSensorsIndex] = getSensorsInMonitoringArea(sensors, monitoringArea);
    sensorsIndex = 1:quantitySensors;
    sensorsPartiallyOutIndex = setdiff(sensorsIndex, containedSensorsIndex);
    sensorsPartiallyOut = sensors(sensorsPartiallyOutIndex);
end