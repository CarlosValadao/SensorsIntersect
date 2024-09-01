% Plota um sensor assumindo que existe uma figura criada no workspace
function plotSensor(sensor, sensorID, showID)
    sensorXPointCoords = sensor.getXPointCoordsLF();
	sensorYPointCoords = sensor.getYPointCoordsLF();
	line(sensorXPointCoords, sensorYPointCoords, 'LineWidth', 3, 'Color', 'b');
	sensorAx = sensor.Ax;
	sensorAy = sensor.Ay;
	sensorPointA = [ sensorAx sensorAy ];
	% plot(sensors{l}.Ax, sensors{l}.Ay, 'ro', 'LineWidth', 5);
	if showID
		plot(sensorPointA(1), sensorPointA(2), 'ro', 'LineWidth', 5);
		text(sensorPointA(1), sensorPointA(2), num2str(sensorID + 1), 'FontSize', 33, 'FontName', 'Times')
	end
end