function AQMrel = calculateAQMrel(barrier, sensors)
    % calculateAQMrel calcula o índice de qualidade relativa do ar (AQMrel) para uma barreira
    % com base na cobertura de blocos de diferentes qualidades (baixa, média, alta).
    % 
    % Parâmetros de entrada:
    %   barrier: Vetor com os índices dos sensores cobertos pela barreira.
    %   sensors: Estrutura contendo os dados dos sensores, incluindo blocos de diferentes qualidades.
    %
    % Retorna:
    %   AQMrel: O índice de qualidade relativa do ar, que é uma média ponderada das qualidades de
    %   cobertura, normalizada pela quantidade total de blocos cobertos.

    % Obtém o tamanho da barreira (número de sensores)
    barrierSize = length(barrier);

    % Inicializa as variáveis para os valores de AQM para diferentes qualidades de bloco
    AQMlow = 0;      % AQM para blocos de baixa qualidade
    AQMmedium = 0;   % AQM para blocos de média qualidade
    AQMhigh = 0;     % AQM para blocos de alta qualidade
    coveredBlocks = 0; % Inicializa o contador de blocos cobertos

    % Define os pesos para cada tipo de qualidade de bloco
    LOW_QUALITY_WEIGHT = 0.25;  % Peso para baixa qualidade
    MID_QUALITY_WEIGHT = 0.5;   % Peso para média qualidade

    % Loop sobre os sensores, começando do segundo até o penúltimo (excluindo o primeiro e o último)
    for k = 2:barrierSize-1
        % Obtém o índice do sensor (ajustado pela subtração de 1)
        sensorIndex = barrier(k) - 1;

        % Recupera os dados do sensor específico
        sensor = sensors(sensorIndex);

        % Conta o número de blocos cobertos de cada qualidade
        numLowQualityCoveredBlocks = length(sensor.lowQualityCoveredBlocks);
        numMediumQualityCoveredBlocks = length(sensor.mediumQualityCoveredBlocks);
        numHighQualityBlocksCoverage = length(sensor.highQualityCoveredBlocks);

        % Calcula o número total de blocos cobertos (soma dos blocos de cada qualidade)
        coveredBlocks = numLowQualityCoveredBlocks + numMediumQualityCoveredBlocks + numLowQualityCoveredBlocks;

        % Atualiza os valores de AQM com base no número de blocos cobertos e seus pesos
        AQMlow = AQMlow + numLowQualityCoveredBlocks * LOW_QUALITY_WEIGHT;      % AQM para baixa qualidade
        AQMmedium = AQMmedium + numMediumQualityCoveredBlocks * MID_QUALITY_WEIGHT;  % AQM para média qualidade
        AQMhigh = AQMhigh + numHighQualityBlocksCoverage;        % AQM para alta qualidade
    end

    % Calcula o AQM não absoluto somando os valores ponderados de AQM
    AQMNotAbs = (AQMlow + AQMmedium + AQMhigh);

    % Calcula o índice de qualidade relativa dividindo o AQM não absoluto pelo número total de blocos cobertos
    AQMrel = AQMNotAbs / coveredBlocks;
end
