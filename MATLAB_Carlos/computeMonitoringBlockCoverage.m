% Computa a cobertura de cada bloco de monitoramento
% atualizando qual sensor cobre este bloco e com qual qualidade
% maxima este bloco esta sendo coberto, levando em consideracao
% caso haja o monitoramento de um bloco por mais de um sensor visual
% Devolve a matriz de blocos atualizada, com as devidas cobertudas,
% com base no array de sensores fornecido em sensors.

% monitoringBlocks e uma matriz nxm
% sensors e um vetor de colunas de tamanho n
% Devolve monitoringBlockCoverages a matriz de cobertura, com o
% grau de qualidade de cobertura de cada bloco de monitoramento
% coveredBlocks - Uma matriz nSensorsx3 que guarda, para cada sensor
% a quantidade de blocos cobertos, com qualidade alta - posicao 1 -,
% media - posicao 2 -, e baixa, posicao 3 de cada linha do array
% Procurar um melhor nome para o retorno `newSensors`
function [newSensors] = computeMonitoringBlockCoverage(monitoringBlocks, sensors)
    % monitoringBlocks = monitoringBlocks;
    [m, n] = size(monitoringBlocks);
    o = length(sensors);
    % coveredBlocks = zeros(o, 3);
    for k = 1:m
        for l = 1:n
            for q=1:o
                [monitoringBlockInside, coverageQuality] = monitoringBlockInSensor(...
                                                        monitoringBlocks(k, l), sensors(q));
                if monitoringBlockInside
                    % monitoringBlockCoverages(k, l).addCoverage(q, coverageQuality);
                    % coveredBlocks(q, coverageQuality) = coveredBlocks(q, coverageQuality) + 1;
                    sensors(q).addBlockCoverage(coverageQuality, monitoringBlocks(k, l));
                end
            end
        end
    end
    newSensors = sensors;
end