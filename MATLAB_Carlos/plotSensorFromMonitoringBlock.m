% Esta funcao plota um sensor a partir
% dos blocos de monitoramento que o
% sensor cobre, de acordo com os niveis
% de FoV (l1, l2 e l3)
% Os MonitoringBlocks que estiverem contidos
% em FoVl1 terao os seus centroides coloridos
% com verde, FoVl2 com amarelo e FoV com Vermelho
function plotSensorFromMonitoringBlock(sensor)
    greenColor = [0.0, 1.0, 0.0];
    yellowColor = [1.0, 1.0, 0.0];
    redColor = [1.0, 0.0, 0.0];
    colors = {greenColor yellowColor redColor};
    for k=1:3
        for monitoringBlock=sensor.coveredBlocks{k}
            plot(monitoringBlock.xBaricenter, monitoringBlock.yBaricenter,...
            's', 'MarkerFaceColor', 'none', 'MarkerEdgeColor', colors{k}, ...
            'MarkerSize', 13, 'LineWidth', 0.9);
        end
    end
end
%plot(0.1250, 4.921875, 's', 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'blue', 'MarkerSize', 15, 'LineWidth', 2)