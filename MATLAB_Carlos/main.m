closeOpenFigures();
clearConsole();

ANGLE = 60;
NUM_SENSORS = 12;
RS = 3;
POV = deg2rad(ANGLE);

THETA_MONITORING_AREA = 0;
XORIGINS_MONITORING_AREA = 0;
YORIGINS_MONITORING_AREA = 5;
MONITORINGAREA_HEIGHT = 5;
MONITORINGAREA_WIDTH = 10;

monitoringArea = generateMonitoringArea( ...
    XORIGINS_MONITORING_AREA, YORIGINS_MONITORING_AREA, ...
    MONITORINGAREA_WIDTH, MONITORINGAREA_HEIGHT, THETA_MONITORING_AREA ...
    );

% Inicializando os sensores	
sensors = randomNSensors( ...
    POV, MONITORINGAREA_HEIGHT, MONITORINGAREA_WIDTH, RS, ...
    NUM_SENSORS ...
    );

figure
title("Disposição dos Sensores na Área de Interesse");
xlim([0 MONITORINGAREA_WIDTH + 5])
ylim([0 MONITORINGAREA_HEIGHT + 5])
grid on
hold on

plotMonitoringArea(monitoringArea);

% do sensor em relação à origem do P1(x,y) da àrea de interesse
adjacencyMatrix = zeros(NUM_SENSORS + 2, NUM_SENSORS + 2);


% Ordenando o vetor de sensores com base na distancia do ponto (Ax, Ay)
% ponto de origem da area de interesse
ordSensors = sortSensorsByDist(sensors, monitoringArea.getVertex(4));
sensorIntersections = cell(2, NUM_SENSORS);


[sensorsPartiallyInMonitoringArea, idx] = getSensorsPartiallyContainedMonitoringArea( ...
    ordSensors, NUM_SENSORS, monitoringArea ...
    );

% fprintf("\t Sensores Parcialmente na area de interesse ->\n");
% disp(idx);
% % disp(["    ->", sensorsPartiallyInMonitoringArea]);
% disp(sensorsPartiallyInMonitoringArea);

upToDateSensors = updateSensorPolygonPartiallyContained(ordSensors, idx, monitoringArea);

% Pode ser usado para saber quais sensores que podem gerar
% uma barreira, uma vez que e plausivel a existencia da intersecao
% de mais de um sensor, com o lado esquerdo da area de interesse

leftSideOfMonitoringArea = monitoringArea.getSegments{4};
idxSensorsLeftSideMonitoringAreaIntersections = findMonitoringAreaSideIntersections( ...
    leftSideOfMonitoringArea, upToDateSensors ...
    );

% Atualizando a matriz de adjacencia que representa o grafo
if length(idxSensorsLeftSideMonitoringAreaIntersections)
    for k=idxSensorsLeftSideMonitoringAreaIntersections
        adjacencyMatrix(1, k+1) = 1;
        adjacencyMatrix(k+1, 1) = 1;
    end
end

rightSide = monitoringArea.getSegments{2};
idxSensorsRightSideMonitoringAreaIntersections = findMonitoringAreaSideIntersections(rightSide, upToDateSensors);

if length(idxSensorsRightSideMonitoringAreaIntersections)
    for k=idxSensorsRightSideMonitoringAreaIntersections
        adjacencyMatrix(NUM_SENSORS+2, k+1) = 1;
        adjacencyMatrix(k+1, NUM_SENSORS+2) = 1;
    end
end

plotSensors(upToDateSensors, NUM_SENSORS);


% Calcula a intersecao entre os sensores
for l = 1:NUM_SENSORS - 1
	disp("-------------------START INTERSECTION-----------------------");
    for m = 1:NUM_SENSORS
        if l ~= m
            [hasIntersection, xIntersectionPoint, yIntersectionPoint] = getSensorsIntersection(upToDateSensors(l), upToDateSensors(m));
            if hasIntersection
				adjacencyMatrix(l+1, m+1) = 1;
				adjacencyMatrix(m+1, l+1) = 1;
                xIntersectionPoint
                yIntersectionPoint
                sensorIntersections{1, l} = xIntersectionPoint;
                sensorIntersections{2, l} = yIntersectionPoint;
                plot(xIntersectionPoint, yIntersectionPoint, 'ms', 'LineWidth', 3);
            else
                fprintf("\nNAO TEVE INTERSECAO\n");
            end
        end
    end
	disp("-------------------END INTERSECTION-----------------------");
end


for l = 1:NUM_SENSORS
	[hasIntersection, xIntersectionPoint, yIntersectionPoint] = getSensorsIntersection(monitoringArea, upToDateSensors(l));
	if hasIntersection
		plot(xIntersectionPoint, yIntersectionPoint, 'ms', 'LineWidth', 3);
	else
		fprintf("\nNAO TEVE INTERSECAO\n");
	end
end


for l=1:NUM_SENSORS-1
    for m=1:NUM_SENSORS
        if l ~= m
            [hi, pol] = interPolygon(upToDateSensors(l), upToDateSensors(m));
            if hi
                fill(pol.getXPointCoordsLF, pol.getYPointCoordsLF, 'r');
            end
        end
    end
end

% names = createArrayNodeLabels("s", NUM_SENSORS);

figure
adjacencyMatrix
grah = graph(adjacencyMatrix);
plot(grah);

path = dfsearch(grah, 1);
path

figure
hold on
grid minor
plotMonitoringArea(monitoringArea);
for n=path'
    x = upToDateSensors(n).getXPointCoordsLF;
    y = upToDateSensors(n).getYPointCoordsLF;
    fill(x, y, 'r');
end

% title("Grafo a Partir das Interseções dos Sensores");
