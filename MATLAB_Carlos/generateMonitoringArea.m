% Calculates and returns a customizable <PlanarPolygon>
%
% Input
%   xorigins - x point coordinate of origin point
%   yorigins - y point coordinate of origin point
%   width    -  width of monitoring area
%   heigth   -  heigth of monitoring area
%   beta     -  angle, in radianus of monitoring area
%
% Output
%   monitoringArea - A <PlanarPolygon> object with these parameters
%
function monitoringArea = generateMonitoringArea(xorigins, yorigins, width, height, beta)
    verticesMonitoringArea = calcVerticesMonitoringArea(xorigins, yorigins, width, height, beta);
    monitoringArea = PlanarPolygon(verticesMonitoringArea{:}); 
end