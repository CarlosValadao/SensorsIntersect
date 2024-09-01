% plot(monitoringBlock.xBaricenter, monitoringBlock.yBaricenter,...
% 's', 'MarkerFaceColor', 'none', 'MarkerEdgeColor', colors{1}, ...
% 'MarkerSize', 13, 'LineWidth', 0.9);

% Coordenadas do primeiro quadrado
x1 = [1 2 2 1 1]; 
y1 = [1 1 2 2 1];

% Coordenadas do segundo quadrado
x2 = [1.5 2.5 2.5 1.5 1.5]; 
y2 = [1.5 1.5 2.5 2.5 1.5];

% Encontrar os pontos de interseção
[xi, yi] = polyxpoly(x1, y1, x2, y2);

% Plotar o primeiro quadrado
figure;
plot(x1, y1, '-b', 'LineWidth', 2); 
hold on;

% Plotar o segundo quadrado
plot(x2, y2, '-r', 'LineWidth', 2);

% Plotar os pontos de interseção
plot(xi, yi, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');

% Personalização do gráfico
xlabel('X');
ylabel('Y');
title('Interseção entre dois quadrados');
legend('Primeiro quadrado', 'Segundo quadrado', 'Pontos de interseção');
grid on;
axis equal;

hold off;

