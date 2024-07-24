% Gerar 4 pontos aleatórios
closeFiguresPreviousOpened();
rng('shuffle'); % Definir a semente do gerador de números aleatórios para reprodutibilidade
num_points = 4;
points = rand(num_points, 2);

% Plotar pontos aleatórios
figure;
plot(points(:,1), points(:,2), 'o', 'MarkerSize', 8);
hold on;

% Computar o Convex Hull
k = convhull(points(:,1), points(:,2));

% Plotar o Convex Hull
plot(points(k,1), points(k,2), 'k-', 'LineWidth', 2);

title('Convex Hull de 4 pontos aleatórios');
xlabel('X');
ylabel('Y');
grid on;
hold off;
