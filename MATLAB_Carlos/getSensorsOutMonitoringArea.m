% "Pega" todos os sensores que estao fora da area de monitoramento
% e os retorna em um array de celulas
% Recebe a area de interesse e o array de celulas que contem todos
% os sensores
% Devolve tambem um array de mesmo tamanho de sensorsOut, mas que
% contem, para cada sensor em sensorsOut, a sua respectiva posicao
% no array original de dados, sensors (que vem como argumento da funcao)

% Nao esta sendo feita nenhuma verificacao de erros aqui nesta funcao
% pode dar alguma besteira, mas eu acredito que essa verificacao de erro
% sera feita em uma camada superior, de tal forma que o dado esperado
% sempre chegue aqui de forma adequada

% Identifica os sensores que estão totalmente fora da área de interesse
% e devolve um arraycontendo estes sensores e os seus repspectivos índices
% com base no array original de sensores
%
%
function [sensorsOut, sensorsOutOriginPositions] = getSensorsOutMonitoringArea(sensors, monitoringArea)
    % sensorsLength = length(sensors);
    % sensorsOutAux = zeros(1, sensorsLength, "logical");
    % numberOfSensorsOutside = 0;
    setSensorsOutside = @(sensor) isSensorTotallyOutMonitoringArea(sensor, monitoringArea);
    % essa parte faz a preparacao, determinando e marcando em um sensor
    % auxiliar os sensores que estao fora da area de interesse
    % enquanto a outra parte sera responsavel por preencher os valores
    % de acordo com o vetor de marcacao e de quantos sensores estao
    % fora da area de interesse
    sensorsAux = arrayfun(setSensorsOutside, sensors);
    [sensorsOut, sensorsOutOriginPositions] = fillCellVectorWithSelection(sensors, sensorsAux);
end
