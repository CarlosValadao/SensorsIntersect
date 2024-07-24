function plotMonitoringArea(monitoringArea)
    plot(monitoringArea.getXPointCoordsLF(), monitoringArea.getYPointCoordsLF(), ...
	 'g-o', 'LineWidth', 2, "MarkerFaceColor", 'k', 'MarkerEdgeColor', 'k');
end
