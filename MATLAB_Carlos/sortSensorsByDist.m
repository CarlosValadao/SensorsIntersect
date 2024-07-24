% Sorts an array of <PlanarPolygon> sensors based on distance
% of your point 1 in relation to another point
%
% Input
%   sensors - sensors array to be sorted
%   point - 2d point, in cartesian plane
%
% Output
%   ordSensors - orded array sensors
function ordSensors = sortSensorsByDist(sensors, point)
    cellfunSensors = arrayfun(@(sensor) sensor.getDistance(point), sensors, 'UniformOutput', true);
    [distOrder, distIndexOrder] = sort(cellfunSensors);
    ordSensors = sensors(distIndexOrder);
end