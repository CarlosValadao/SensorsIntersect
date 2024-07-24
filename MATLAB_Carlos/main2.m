% Testando o funcionamento da funcao polyxpoly do matlab
% interpoly e getFullPlanarPolygonIntersection

closeFiguresPreviousOpened();
p1 = [ 4 2];
p2 = [ -1 -1 ];
p3 = [ -3 6 ];

pol1 = monitoringArea;
pol2 = PlanarPolygon(p1, p2, p3);

x1 = monitoringArea.getXPointCoordsLF;
y1 = monitoringArea.getYPointCoordsLF;
x2 = pol2.getXPointCoordsLF;
y2 = pol2.getYPointCoordsLF;

figure
hold on
grid on
plotPlanarPolygon(pol1);
plotPlanarPolygon(pol2);


plot(x1, y1, 'ms');
plot(x2, y2, 'ms');
% [xi, yi] = polyxpoly(x1, y1, x2, y2);
[newPolygon] = interPolygon(pol1, pol2);
% plot(xi, yi, 'gs', 'LineWidth', 5);
% xi
% yi

% Definir os pontos para os segmentos de reta
% x1 = [1 3 1];
% y1 = [1 3 1];
% 
% x2 = [2 4 2];
% y2 = [3 1 3];
% 
% p1 = [1 1];
% p2 = [2 2];
% q1 = [-1 1];
% q2 = [4 1];
% 
% % Calcular a interseção entre os segmentos de reta
% [has, x_intersecao, y_intersecao] = getSegmentsIntersection(p1, p2, q1, q2);
% % x_intersecao
% % y_intersecao
% % Plotar os segmentos de reta e a interseção
% figure;
% plot(getxcoord(p1,p2), getycoord(p1,p2), 'b-o', getxcoord(q1, q2), getycoord(q1,q2), 'r-o', x_intersecao, y_intersecao, 'go');
% legend('Segmento de Reta 1', 'Segmento de Reta 2', 'Interseção');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% title('Interseção entre Segmentos de Reta');
% grid on;
