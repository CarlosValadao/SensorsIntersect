% Faz o plot de um bloco de monitoramento
% plotando também o seu centróide
function plotMonitoringBlock(monitoringBlock, pointSize)
    monitoringBlockXV = monitoringBlock.getXPointCoordsLF();
    monitoringBlockYV = monitoringBlock.getYPointCoordsLF();
    plot(monitoringBlockXV, monitoringBlockYV, 'k-', 'LineWidth', 1);
    plot(monitoringBlock.xBaricenter, monitoringBlock.yBaricenter, 'ko', ...
        'MarkerSize', pointSize, 'MarkerFaceColor', 'k');
end