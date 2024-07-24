% Plot a <PlanarPolygon> in previous open figure and selected
%
% Input
%   planarPolygon - A <PlanarPolygon> object
%
% Output
%
function plotPlanarPolygon(planarPolygon)
    plot(planarPolygon.getXPointCoordsLF, planarPolygon.getYPointCoordsLF, 'LineWidth', 3);
end