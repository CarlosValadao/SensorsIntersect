% randomNMonitoringBlocks(0, 5, 10, 5, 0, 0.5, 0.625)
% a = ans;
% closeAllFigures
% setupPlot();
% plotMonitoringAreaFromMonitoringBlocks(a)
% plotSensors(sensors, 2, true)

% for mb = s1.lowQualityCoveredBlocks
%     plot(mb.xBaricenter, mb.yBaricenter, 'ms', 'LineWidth', 5);
% end
% 
% for mbm = sensors(1).mediumQualityCoveredBlocks
%     plot(mbm.xBaricenter, mbm.yBaricenter, 'ks', 'LineWidth', 5);
% end

% Pontos do triângulo
tri_x = [1, 3, 2];
tri_y = [1, 1, 4];

tr = { [1 1] [3 1] [2 4] };
rr = { [5 1] [8 1] [8 3] [5 3] };

% Pontos do retângulo
rect_x = [5, 8, 8, 5];
rect_y = [1, 1, 3, 3];

% Plotar o triângulo
figure;
hold on;
plot([tri_x, tri_x(1)], [tri_y, tri_y(1)], 'b-', 'LineWidth', 2, 'Marker', 'o', 'MarkerFaceColor', 'b');
text(tri_x(1), tri_y(1), 'A', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(tri_x(2), tri_y(2), 'B', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(tri_x(3), tri_y(3), 'C', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

% Plotar o retângulo
plot([rect_x, rect_x(1)], [rect_y, rect_y(1)], 'r-', 'LineWidth', 2, 'Marker', 'o', 'MarkerFaceColor', 'r');
text(rect_x(1), rect_y(1), 'D', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(rect_x(2), rect_y(2), 'E', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(rect_x(3), rect_y(3), 'F', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(rect_x(4), rect_y(4), 'G', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

% Configurações da tela
axis equal;
xlabel('X');
ylabel('Y');
title('Triângulo e Retângulo');
grid on;
hold off;
