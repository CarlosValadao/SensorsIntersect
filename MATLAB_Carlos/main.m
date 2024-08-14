closeAllFigures();
clearConsole();

% degrees
ANGLE = 30;
NUM_SENSORS = 7;
RS = 3;
POV = deg2rad(ANGLE);

INPUT_METHOD = "FromUser";
SENSOR_LABEL_PREFFIX = '';
THETA_MONITORING_AREA = 0;
XORIGINS_MONITORING_AREA = 0;
YORIGINS_MONITORING_AREA = 5;
MONITORINGAREA_HEIGHT = 5;
MONITORINGAREA_WIDTH = 10;
LEFT_SIDE_OF_MONITORING_AREA = 1;
RIGHT_SIDE_OF_MONITORING_AREA = NUM_SENSORS + 2;

monitoringArea = generateMonitoringArea( ...
    XORIGINS_MONITORING_AREA, YORIGINS_MONITORING_AREA, ...
    MONITORINGAREA_WIDTH, MONITORINGAREA_HEIGHT, THETA_MONITORING_AREA ...
    );

% Inicializando os sensores
sensors = generateSensors(INPUT_METHOD, POV, MONITORINGAREA_HEIGHT, ...
                            MONITORINGAREA_WIDTH, RS, NUM_SENSORS, monitoringArea);
                            
intersectionsAdjacencyMatrix = zeros(NUM_SENSORS + 2, NUM_SENSORS + 2);

% Ordenando o vetor de sensores com base na distancia do ponto (Ax, Ay)
% do sensor em relação à origem do P1(x,y) da àrea de interesse
% ponto de origem da area de interesse
ordSensors = sortSensorsByDist(sensors, monitoringArea.getVertex(4));

notPreProcessedSensorsFigure = setupPlot();
plotMonitoringArea(monitoringArea);
plotSensors(ordSensors, NUM_SENSORS, true);
title("Sensores antes do pré-processamento");

[sensorsPartiallyInMonitoringArea, idxSensorsPartiallyContained] = getSensorsPartiallyContainedMonitoringArea( ...
    ordSensors, NUM_SENSORS, monitoringArea ...
    );
    
leftSideOfMonitoringArea = monitoringArea.getSegments{4};
% [idxSensorsLeftSideMonitoringAreaIntersections, lxi, lyi] = findMonitoringAreaSideIntersections(...
%     leftSideOfMonitoringArea, ordSensors ...
%     );
[idxSensorsLeftSideMonitoringAreaIntersections] = findMonitoringAreaSideIntersections(...
    leftSideOfMonitoringArea, ordSensors ...
    );

% Atualizando a matriz de adjacencia que representa o grafo
if isnotempty(idxSensorsLeftSideMonitoringAreaIntersections)
    for idx=idxSensorsLeftSideMonitoringAreaIntersections
        intersectionsAdjacencyMatrix(1, idx+1) = 1;
        intersectionsAdjacencyMatrix(idx+1, 1) = 1;
    end
end

rightSideOfMonitoringArea = monitoringArea.getSegments{2};
% [idxSensorsRightSideMonitoringAreaIntersections, rxi, ryi] = findMonitoringAreaSideIntersections( ...
%     rightSideOfMonitoringArea, ordSensors);

[idxSensorsRightSideMonitoringAreaIntersections] = findMonitoringAreaSideIntersections( ...
    rightSideOfMonitoringArea, ordSensors);

% Atualizando a matriz de adjacencia que representa o grafo
if isnotempty(idxSensorsRightSideMonitoringAreaIntersections)
    for idx=idxSensorsRightSideMonitoringAreaIntersections
        intersectionsAdjacencyMatrix(NUM_SENSORS+2, idx+1) = 1;
        intersectionsAdjacencyMatrix(idx+1, NUM_SENSORS+2) = 1;
    end
end

% [upToDateSensors, xinters, yinters] = updateSensorPolygonPartiallyContained(ordSensors, ...
%                             idxSensorsPartiallyContained, monitoringArea, ...
%                             idxSensorsLeftSideMonitoringAreaIntersections, ...
%                             idxSensorsRightSideMonitoringAreaIntersections);

[upToDateSensors] = updateSensorPolygonPartiallyContained(ordSensors, ...
                            idxSensorsPartiallyContained, monitoringArea);

preProcessedSensorsFigure = setupPlot();
plotMonitoringArea(monitoringArea);
plotSensors(upToDateSensors, NUM_SENSORS, true);
% pontos de intersecao com o lado esquerdo e direito
% da area de interesse
% plot(lxi, lyi, 'ms', 'LineWidth', 4);
% plot(rxi, ryi, 'ms', 'LineWidth', 4);
% pontos de intersecao dos poligonos parcialmente contidos
% na area de interesse
% plot(xinters, yinters, 'ms', 'LineWidth', 4);
title("Sensores depois do pré-processamento");


% Calcula a intersecao entre os sensores
% de todos para todos
% Apesar de feio, e útil
for l = 1:NUM_SENSORS - 1
    for m = 1:NUM_SENSORS
        if l ~= m
            [hasIntersection, xIntersectionPoint, yIntersectionPoint] = getSensorsIntersection( ...
                                                            upToDateSensors(l), upToDateSensors(m));
            if hasIntersection
				intersectionsAdjacencyMatrix(l+1, m+1) = 1;
				intersectionsAdjacencyMatrix(m+1, l+1) = 1;
                plot(xIntersectionPoint, yIntersectionPoint, 'ms', 'LineWidth', 4);
            end
        end
    end
end

intersectionsGraphFigure = setupPlot();
left2RightSidePaths = findAllPaths(intersectionsAdjacencyMatrix, ...
    LEFT_SIDE_OF_MONITORING_AREA, RIGHT_SIDE_OF_MONITORING_AREA);
numLeft2RightSidePaths = length(left2RightSidePaths);
fprintf("EXISTE(M) %s CAMINHO(S) ENTRE L E R\n", num2str(numLeft2RightSidePaths));
graphLabels = createArrayNodeLabels(SENSOR_LABEL_PREFFIX, NUM_SENSORS);
intersectionsGraph = graph(intersectionsAdjacencyMatrix, graphLabels);
plot(intersectionsGraph);
title("Grafo de interseções");

if numLeft2RightSidePaths > 0
    barrierId = randperm(numLeft2RightSidePaths, 1);
    barrierSensorsIdx = left2RightSidePaths{barrierId};
    undefinedPolygonBarrierFigure = setupPlot();
    plotMonitoringArea(monitoringArea);
    plotBarrier(left2RightSidePaths, barrierId, upToDateSensors, numLeft2RightSidePaths);

    definedPolygonBarrierFigure = setupPlot();
    barrierPolygon = growingPoly(barrierSensorsIdx, upToDateSensors);
    plotMonitoringArea(monitoringArea);
    plot(barrierPolygon);
    customPolygonBarrierTitle = sprintf("Polígono correspondente a barreira n° %s", ...
                                num2str(barrierId));
    title(customPolygonBarrierTitle);
end