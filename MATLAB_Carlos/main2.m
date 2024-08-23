% randomNMonitoringBlocks(0, 5, 10, 5, 0, 0.5, 0.625)
% a = ans;
% closeAllFigures
% setupPlot();
% plotMonitoringAreaFromMonitoringBlocks(a)
% plotSensors(sensors, 2, true)

for mb = s1.lowQualityCoveredBlocks
    plot(mb.xBaricenter, mb.yBaricenter, 'ms', 'LineWidth', 5);
end

for mbm = sensors(1).mediumQualityCoveredBlocks
    plot(mbm.xBaricenter, mbm.yBaricenter, 'ks', 'LineWidth', 5);
end