% Verifica se um dado sensor esta fora de uma determinada area de interesse
% ou nao, dada os pontos que determinam o polígono que é a área de interesse
% na forma de xcoords - coordenadas x dos pontos e analogamente para ycoords.
% sensor é o sensor a ser verificado

% Um sensor possui o seguinte esqueleto
% -> (1) sensor.angle
% -> (2) sensor.POV
% -> (3) sensor.RS
% -> (4) sensor.Ax
% -> (5) sensor.Ay
% -> (6) sensor.Bx
% -> (7) sensor.By
% -> (8) sensor.Cx
% -> (9) sensor.Cy
% -> (10) sensor.dist
% -> (11) sensor.ABLineEq
% -> (12) sensor.ACLineEq
% -> (13) sensor.BCLineEq
% -> (14) sensor.ABSegment
% -> (15) sensor.ACSegment
% -> (16) sensor.BCSegment
% ->

% Verifica se um sensor esta parcialmente fora da area de monitoramento
% true caso verdade e false caso contrario
function [out] = isSensorOutOfMonitoringArea(sensor, monitoringArea)
    % sensorABLineEq = sensor.ABLineEq;
    % sensorACLineEq = sensor.ACLineEq;
    % MAxcoords = swap(MAxcoords, 3, 4);
    % MAycoords = swap(MAycoords, 3, 4);
    APoint = sensor.getAPoint();
    BPoint = sensor.getBPoint();
    CPoint = sensor.getCPoint();
    monitoringAreaXCoords = monitoringArea.getXPointCoords();
    monitoringAreaYCoords = monitoringArea.getYPointCoords();
    
    aOutside = ~inpolygon(APoint(1), APoint(2), ...
                monitoringAreaXCoords, monitoringAreaYCoords);
    bOutside = ~inpolygon(BPoint(1), BPoint(2), ...
                 monitoringAreaXCoords, monitoringAreaYCoords);
    cOutisde = ~inpolygon(CPoint(1), CPoint(2), ...
                     monitoringAreaXCoords, monitoringAreaYCoords);
    if aOutside|| bOutside || cOutisde
        out = true;
    else
        out = false;
    end
end


