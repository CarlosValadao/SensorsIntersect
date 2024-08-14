% Definir os pontos finais da Reta 1
x1 = [1 4];
y1 = [1 4];

% Definir os pontos finais da Reta 2
x2 = [1 3];
y2 = [1 3];

% Calcular a interseção
[xi, yi] = polyxpoly(x1, y1, x2, y2);

% Exibir os resultados
% disp(['Ponto de interseção: (', num2str(xi), ', ', num2str(yi), ')']);

% Plotar as retas
figure;
plot(x1, y1, '-o', 'DisplayName', 'Reta 1');
hold on;
plot(x2, y2, '-s', 'DisplayName', 'Reta 2');

% Plotar o ponto de interseção, se existir
if ~isempty(xi) && ~isempty(yi)
    plot(xi, yi, 'rx', 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Interseção');
end

% Configurar o gráfico
xlabel('Eixo X');
ylabel('Eixo Y');
title('Interseção entre Duas Retas');
legend show;
grid on;
