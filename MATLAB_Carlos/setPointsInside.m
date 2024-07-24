% Muda os pontos de um segmento de um sensor
% <sensorSegment> para aqueles que estao contidos
% na area de interesse *monitoringArea* a partir da perspectiva
% de uma aresta <monitoringAreaSegment>
%
function setPointsInside(sensorSegment, monitoringAreaSegment, ...
                        monitoringAreaXCoords, monitoringAreaYCoords)
    sensorSegmentStartPoint = sensorSegment.getStartPoint();
    sensorSegmentEndPoint = sensorSegment.getEndPoint();
    [hasIntersection, x, y] = getSegmentsIntersection(sensorSegment, monitoringAreaSegment);
    if hasIntersection
        interPoint = [x y];
        startPointOutside = ~inpolygon(sensorSegmentStartPoint(1), sensorSegmentStartPoint(2), ...
                                        monitoringAreaXCoords, monitoringAreaYCoords);
        endPointOutside = ~inpolygon(sensorSegmentEndPoint(1), sensorSegmentEndPoint(2), ...
            monitoringAreaXCoords, monitoringAreaYCoords);
        if startPointOutside
            sensorSegment.setStartPoint(interPoint);
        elseif endPointOutside
            sensorSegment.setEndPoint(interPoint);
        else
            error("NEM START NEM ENDPOINT");
        end
    end
end