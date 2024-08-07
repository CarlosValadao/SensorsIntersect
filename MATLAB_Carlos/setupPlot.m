% Cria uma nova figura, permite
% sobrescrita e ativa o grid
% Devolve o handle da figura que acaba
% de ser criada
function handle = setupPlot()
    handle = figure;
    grid minor;
    hold on;
end