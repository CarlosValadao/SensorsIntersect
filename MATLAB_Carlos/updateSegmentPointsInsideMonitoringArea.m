% Atualiza o ponto de um segmento sabendo que a funcao e normal ou inverse
% (em funcao de x ou de y)
function updateSegmentPointsInsideMonitoringArea(sensorSegment, monitoringArea)
    monitoringAreaXCoords = monitoringArea.getXPointCoords();
    monitoringAreaYCoords = monitoringArea.getYPointCoords();
    monitoringAreaSegments = monitoringArea.getSegments();
    % monitoringAreaSegmentsParallelToX = monitoringArea.getSegmentsParallelToX();
    % monitoringAreaSegmentsParallelToY = monitoringArea.getSegmentsParallelToY();
    for k = 1:4
        setPointsInside(sensorSegment, monitoringAreaSegments{k}, monitoringAreaXCoords, monitoringAreaYCoords);
    end
    % if mode == "parallelToX"
    %     for k = 1:2
    %         setPointsInside(sensorSegment, monitoringAreaSegmentsParallelToX(k), ...
    %                         monitoringAreaXCoords, monitoringAreaYCoords);
    %     end
    % elseif mode == "parallelToY"
    %     % Fazer a lógica para inverter a funcao que passa pelos pontos
    %     % que delimitam o segmento
    %     for l = 1:2
    %         setPointsInside(sensorSegment, monitoringAreaSegmentsParallelToY(l), ...
    %                         monitoringAreaXCoords, monitoringAreaYCoords);
    %     end
    % end
end