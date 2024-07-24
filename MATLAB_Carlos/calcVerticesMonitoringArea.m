% Calculates the coordinates of the vertices of the monitoring area
% with origin point (xorigins, yorigins), width witdth, height height,
% and angle beta
%
% Input
%   xorigins - x point coordinate of origin point
%   yorigins - y point coordinate of origin point
%   width    -  width of monitoring area
%   heigth   -  heigth of monitoring area
%   beta     -  angle, in radianus of monitoring area
%
% Output
%   monitoringAreaVertices - cell array 4x2 of vertices
function verticesMonitoringArea = calcVerticesMonitoringArea(xorigins, yorigins, width, height, beta)
    verticesMonitoringArea = cell(1, 4);
    verticesMonitoringArea{1} = [ xorigins, yorigins ];
    verticesMonitoringArea{2} = [ xorigins + width*cos(beta), yorigins + width*sin(beta) ];
    verticesMonitoringArea{3} = [ xorigins + (height*sin(beta)) + (width*cos(beta)), yorigins - (height*cos(beta)) + (width*sin(beta)) ];
    verticesMonitoringArea{4} = [ xorigins + height*sin(beta), yorigins - height*cos(beta) ];
end