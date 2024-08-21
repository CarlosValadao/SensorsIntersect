% Esta funcao gera nsensores, de forma aleatoria
% e dolve um array de PlanarPolygon com nSensors de
% pOV pOV, RS rS, de tal forma que a coordenada x do ponto
% A é menor ou igual que monitoringAreaWitdh e a coordenada y do ponto
% A é menor ou igual que monitoringAreaHeight
% O angulo esta sendo sorteado, a cada novo sorteio de sensores
function nSensorsArray = randomNSensors(pOV, monitoringAreaHeigth, monitoringAreaWidth, rS, nSensors)
    sensorAngle = deg2rad(randperm(90, 1));
    A = [ randperm(monitoringAreaWidth - 1, 1) randperm(monitoringAreaHeigth - 1, 1) ];
    B = [ (A(1) + rS*cos(sensorAngle)) (A(2) + rS*sin(sensorAngle)) ];
    C = [ (A(1) + rS*cos(mod(sensorAngle + pOV, 2*pi))) (A(2) + rS*sin(mod(sensorAngle + pOV, 2*pi))) ];
    sensor = PlanarPolygon(A, B, C);
    nSensorsArray = repmat(sensor, 1, nSensors);
    for k = 2:nSensors
	    sensorAngle = deg2rad(randperm(90, 1));
	    A = [ randperm(monitoringAreaWidth - 1, 1) randperm(monitoringAreaHeigth - 1, 1) ];
	    B = [ (A(1) + rS*cos(sensorAngle)) (A(2) + rS*sin(sensorAngle)) ];
	    C = [ (A(1) + rS*cos(mod(sensorAngle + pOV, 2*pi))) (A(2) + rS*sin(mod(sensorAngle + pOV, 2*pi))) ];
	    sensor = PlanarPolygon(A, B, C);
	    nSensorsArray(k) = sensor;
    end
end