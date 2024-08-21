% plota a area de monitoramento a partir de uma
% matriz de MonitoringBlocks, que representa
% a area de monitoramento
function plotMonitoringAreaFromMonitoringBlocks(monitoringBlocks)
    title("Area de monitoramento a partir dos blocos de monitoramento");
    [m, n] = size(monitoringBlocks);
    pointSize = (1/(m*n))*300;
    for k=1:m
        for l=1:n
            plotMonitoringBlock(monitoringBlocks(k, l), pointSize);
        end
    end
end