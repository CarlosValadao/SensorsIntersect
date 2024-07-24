% identifySensorOutside = @(sensor) ...
%                         isSensorContainedInMonitoringArea(sensor, monitoringArea);
% cellfun(identifySensorOutside, sensors)

% sortSensorsByDist(sensors, monitoringArea.getOriginPoint());

% getSensorsOutMonitoringArea(sensors, monitoringArea);

% ma = calcMonitoringAreaPoints(0, 5, 10, 5, 0)
% ma = PlanarPolygon(ma{:});
% figure
% hold on
% grid on
% plotPlanarPolygon(ma);

% getSegmentsIntersection(ma2, s7e4);

% createArrayNodeLabels("s", 5)

% interPolygon(sensorsu(2), sensorsu(3))

figure
hold on
grid minor

for l=1:sensors_amnt-1
    for m=1:sensors_amnt
        if l ~= m
            [hi, pol] = interPolygon(sensorsu(l), sensorsu(m));
            if hi
                fill(pol.getXPointCoordsLF, pol.getYPointCoordsLF, 'r');
            end
        end
    end
end

% findMonitoringAreaSideIntersections(monitoringArea.getSegments{4}, sensorsu)


% [h, xi, yi] = intersectSegmentWithSensor(monitoringArea.getSegments{2}, sensorsu(12));


% figure
% hold on
% grid on
% grid minor
% 
% plotSensors(sensorsu, 7);
% 
% for k=1:7
%     for l=1:6
%         if k ~= l
%             [h, pol] = interPolygon(sensorsu(k), sensorsu(l));
%             if h
%                 % plotPlanarPolygon(pol);
%                 fill(pol.getXPointCoordsLF, pol.getYPointCoordsLF, 'r');
%             end
%         end
%     end
% end

% sensorsu = updateSensorPolygonPartiallyContained(ordSensors, idx, monitoringArea);
% for k=idx
%     plotPlanarPolygon(sensorsu(k));
% end
% m = monitoringArea.getSegments{2}
% m.contains(ss.getStartPoint);

% m = monitoringArea.getSegments{2};
% sensorsu.getSegments{1}.getEndPoint
% sensorsu.getSegments{1}.getStartPoint
% m.contains()

% [h, xi, yi] = getSensorsIntersection(monitoringArea, sensorsu(7));
% 
% 
% for k=sensorsu(7).getSegments()
%     k{1}
% end

% s7v = {[10 2.4040]  [10.0000 4.5157]  [9.4175 4.9708]  [9 2]};
% s7p = PlanarPolygon(s7v{:});


% getSegmentsIntersection(m, ss);


% su4 = sensorsu(4);
% ma = monitoringArea;
% 
% su4x = su4.getXPointCoordsLF();
% su4y = su4.getYPointCoordsLF();
% max = ma.getXPointCoordsLF();
% may = ma.getYPointCoordsLF();
% 
% [xi, yi] = polyxpoly(su4x, su4y, max, may, 'unique');
% plot(xi, yi, 'gs', 'LineWidth', 5);

% [h, x, y] = interPolygon(sensorsPartiallyInMonitoringArea(4), monitoringArea);

% Plotar a area em comum entre os sensores que estao parcialmente contido
% na area de interesse e a area de interesse

% closeFiguresPreviousOpened();

% for sensor=sensorsPartiallyInMonitoringArea
%     [h, xi, yi] = interPolygon(sensor, monitoringArea);
%     % fill(xi, yi, 'r');
%     plot(xi, yi, 'ks', 'LineWidth', 5);
% end

% p1 = [ 1 1 ];
% p2 = [ 1 6 ];
% p3 = [ 3 2 ];
% p4 = [ 6 2];

% figure
% hold on
% polygon1 = PlanarPolygon(p1, p2, p3);
% plotPlanarPolygon(polygon1);
% polygon2 = PlanarPolygon(p1, p2, p4);
% plotPlanarPolygon(polygon2);
% interPolygon(polygon1, polygon2);
% [x, y] = polyxpoly(polygon1.getXPointCoords, polygon1.getYPointCoords, polygon2.getXPointCoords, polygon2.getYPointCoords)
% [h, x1, y1] = interPolygon(polygon1, polygon2);
% plot(x, y, 'ms', 'LineWidth', 3);

% polygon3 = PlanarPolygon(p1, p2, p3);

% polygon3.eq(polygon1);

% for k=1:7
%     if isSensorContainedInMonitoringArea(ordSensors(k), monitoringArea)
%         fprintf("\tSensor ID -> %s CONTIDO\n", num2str(k));
%     end
% end
% 
% setSensorsInMonitoringArea = @(sensor) isSensorContainedInMonitoringArea(sensor, monitoringArea);
% sensorsAux = arrayfun(setSensorsInMonitoringArea, sensors);


% monitoringArea = MonitoringArea(0, 5, 10, 5, 0);
% C = [-1, 1];
% D = [10, 23];
% s2 = Segment(C, D, true);
% 
% s2
% 
% hold on
% 
% plot(monitoringArea.getXPointCoords(), monitoringArea.getYPointCoords(), ...
% 	 'g-o', 'LineWidth', 2, "MarkerFaceColor", 'k', 'MarkerEdgeColor', 'k');
% 
% plot(s2.getXCoords(), s2.getYCoords(), 'r-o');
% 
% updateSegmentPointsInsideMonitoringArea(s2, monitoringArea);
% s2

