% Atualiza os niveis de sensores, uma vez que
% o poligono que representa o sensor, em sua totalidade
% que anteriormente era uma triangulo isosceles, mudou
% dessa forma todos os levels de FoV tambem devem
% ser alterados
% Recebe -> O novo poligono (polyshape)
%        -> Sensor cujo os fov levels devem ser alterados
% retorno -> Nada
function updateSensorFoVLevels(newPolygon, sensor)
    sensorFoVL1Polyshape = sensor.foVL1Polyshape;
    sensorFoVL2Polyshape = sensor.foVL2Polyshape;
    sensorFoVL3Polyshape = sensor.foVL3Polyshape;
    newSensorFoVL1Polyshape = intersect(newPolygon, sensorFoVL1Polyshape);
    newSensorFoVL2Polyshape = intersect(newPolygon, sensorFoVL2Polyshape);
    newSensorFoVL3Polyshape = intersect(newPolygon, sensorFoVL3Polyshape);
    sensor.setFoVL1Polyshape(newSensorFoVL1Polyshape);
    sensor.setFoVL2Polyshape(newSensorFoVL2Polyshape);
    sensor.setFoVL3Polyshape(newSensorFoVL3Polyshape);
end