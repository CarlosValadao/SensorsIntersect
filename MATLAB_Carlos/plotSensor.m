% Plota um sensor assumindo que existe uma figura criada no workspace
function plotSensor(sensor, sensorID)
    sensorXPointCoords = sensor.getXPointCoordsLF();
	sensorYPointCoords = sensor.getYPointCoordsLF();
	line(sensorXPointCoords, sensorYPointCoords, 'LineWidth', 3, 'Color', 'b');
	sensorPointA = sensor.getVertex(1);
	% plot(sensors{l}.Ax, sensors{l}.Ay, 'ro', 'LineWidth', 5);
	plot(sensorPointA(1), sensorPointA(2), 'ro', 'LineWidth', 5);
	text(sensorPointA(1), sensorPointA(2), num2str(sensorID), 'FontSize', 26, 'FontName', 'Times')
end