function AQMabs = calculateBarrierAQMabs(barrier, sensors, mb_width, mb_height)
    % calculateBarrierAQMabs calcula o valor absoluto de AQM (Air Quality Measure)
    % para uma barreira, com base nos sensores e suas coberturas de blocos de diferentes qualidades.
    % 
    % Parâmetros de entrada:
    %   barrier: Vetor com os índices dos sensores cobertos pela barreira.
    %   sensors: Estrutura contendo dados dos sensores, incluindo coberturas de blocos de baixa, média e alta qualidade.
    %   mb_width: Largura da área da barreira.
    %   mb_height: Altura da área da barreira.
    %
    % Retorna:
    %   AQMabs: O valor absoluto calculado de AQM com base na qualidade da cobertura.

    % Obtém o tamanho da barreira (número de sensores na barreira)
    barrierSize = length(barrier);
    
    % Inicializa as variáveis para os valores AQM de diferentes qualidades de bloco
    AQMlow = 0;      % AQM para blocos de baixa qualidade
    AQMmedium = 0;   % AQM para blocos de média qualidade
    AQMhigh = 0;     % AQM para blocos de alta qualidade
    LOW_QUALITY_WEIGHT = 0.25;
    MID_QUALITY_WEIGHT = 0.5;
    % Loop sobre os sensores, começando do segundo até o penúltimo
    for k = 2:barrierSize-1
        % Obtém o índice do sensor (ajustado pela subtração de 1)
        sensorIndex = barrier(k) - 1;
        
        % Recupera os dados do sensor específico
        sensor = sensors(sensorIndex);
        
        % Conta o número de blocos cobertos de cada qualidade
        numLowQualityCoveredBlocks = length(sensor.lowQualityCoveredBlocks);
        numMediumQualityCoveredBlocks = length(sensor.mediumQualityCoveredBlocks);
        numHighQualityBlocksCoverage = length(sensor.highQualityCoveredBlocks);
        
        % Atualiza os valores de AQM com base nos blocos cobertos de cada qualidade
        AQMlow = AQMlow + numLowQualityCoveredBlocks * LOW_QUALITY_WEIGHT;      % AQM para baixa qualidade (peso 0.25)
        AQMmedium = AQMmedium + numMediumQualityCoveredBlocks * MID_QUALITY_WEIGHT;  % AQM para média qualidade (peso 0.75)
        AQMhigh = AQMhigh + numHighQualityBlocksCoverage;        % AQM para alta qualidade (peso 1)
    end

    % Calcula o AQM absoluto multiplicando os valores de AQM pelos parâmetros de área da barreira
    AQMabs = (AQMlow + AQMmedium + AQMhigh) * mb_width * mb_height;
    
end
