%% updateSensorCoverageDifference
% Atualiza a distribuição de cobertura entre dois sensores com base nos blocos monitorados.
%
% Esta função verifica os blocos de monitoramento do sensor fonte (`sensorSrc`) e
% compara com a cobertura do sensor destino (`sensorDst`). Se um bloco estiver
% dentro do alcance do sensor destino, mas com menor qualidade de cobertura,
% ele é transferido do sensor fonte para o sensor destino.
%
% Parâmetros:
%   - sensorSrc: Objeto do sensor de origem contendo os blocos monitorados.
%   - sensorDst: Objeto do sensor de destino que pode assumir blocos do sensor fonte.
%
% Autor: Carlos Valadão
% Data: 10/02/2025

function updateSensorCoverageDifference(sensorSrc, sensorDst)
    % Itera sobre os três níveis de qualidade de cobertura
    for k = 1:3
        sensorsCoverageQuality = k; % Define o nível atual de qualidade
        sensorSrcMonitoringBlocks = sensorSrc.coveredBlocks{k}; % Obtém os blocos cobertos
        numMonitoringBlocks = length(sensorSrcMonitoringBlocks); % Número de blocos monitorados

        % Itera sobre todos os blocos de monitoramento do sensor fonte
        for l = 1:numMonitoringBlocks
            monitoringBlock = sensorSrcMonitoringBlocks(l); % Seleciona um bloco específico
            
            % Verifica se o bloco está dentro da cobertura do sensor destino
            [isMonitoringBlockInside, sensorDstCoverageQuality] = ...
                monitoringBlockInSensor(monitoringBlock, sensorDst);

            % Se o bloco estiver dentro e a cobertura for menor, transfere o bloco
            if isMonitoringBlockInside && sensorDstCoverageQuality < sensorsCoverageQuality
                sensorSrc.removeBlockCoverage(sensorsCoverageQuality, monitoringBlock);
                sensorDst.addBlockCoverage(sensorDstCoverageQuality, monitoringBlock);
            end
        end
    end
end
