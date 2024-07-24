closeFiguresPreviousOpened();
% Gerar os vértices do primeiro polígono aleatoriamente
num_vertices_p1 = 3; % Número de vértices do primeiro polígono
x_p1 = rand(1, num_vertices_p1); % Coordenadas x aleatórias
y_p1 = rand(1, num_vertices_p1); % Coordenadas y aleatórias

% Gerar os vértices do segundo polígono aleatoriamente
num_vertices_p2 = 4; % Número de vértices do segundo polígono
x_p2 = rand(1, num_vertices_p2); % Coordenadas x aleatórias
y_p2 = rand(1, num_vertices_p2); % Coordenadas y aleatórias

p1 = joinXYCoordinates(x_p1, y_p1);
p2 = joinXYCoordinates(x_p2, y_p2);

% pol1 = PlanarPolygon(p1(1,:), p1(2,:), p1(3,:), p1(4,:), p1(5,:));
% pol2 = PlanarPolygon(p2(1,:), p2(2,:), p2(3,:), p2(4,:), p2(5,:), p2(6,:));

pol1 = PlanarPolygon(p1(1,:), p1(2,:), p1(3,:));
pol2 = PlanarPolygon(p2(1,:), p2(2,:), p2(3,:));


figure;
hold on;
plotPlanarPolygon(pol1);
plotPlanarPolygon(pol2);

[h, xin, yin] = interPolygon(pol1, pol2);
if h
    plot(xin, yin, 'ms', 'LineWidth', 3);
else
    disp("NAO EXISTE INTERSECAO ENTRE OS POLIGONOS");
end


p1XVertices = pol1.getXPointCoords();
p1YVertices = pol1.getYPointCoords();
p2XVertices = pol2.getXPointCoords();
p2YVertices = pol2.getYPointCoords();


% [h, xin, yin] = getFullPlanarPolygonIntersection(pol1, pol2);
% 
% if h
%     plot(xin, yin, 'ms', 'LineWidth', 3);
% end
% 
% fprintf("\t\t\t OS PONTOS DE INTERSECAO ENTRE OS POLIGONOS SAO:\n\n");
% disp(points);
% points = joinXYCoordinates(xin, yin);
% k = convhull(points(:,1), points(:,2));
% fprintf("\t\t\t OS PONTOS DE INTERSECAO ORDENADOS COM BASE EM CONVEX HULL\n");
% disp(points(k));
% figure
% hold on
% plot(points(k,1), points(k,2), 'k-', 'LineWidth', 3);
% fill(points(k,1), points(k,2), 'r');
fill(xin, yin, 'r');
