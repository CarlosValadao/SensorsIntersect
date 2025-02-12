function barrierArea = calculateBarrierAreaFromMonitoringBlocks(barrierPath, sensors, mb_width, mb_height)
    % COMPUTEBARRIERAREA Calcula a área total coberta por sensores ao longo de uma barreira.
    %   barrierArea = COMPUTEBARRIERAREA(barrierPath, sensors, mb_width, mb_height)
    %   calcula a área total coberta pelos sensores posicionados ao longo da barreira.
    %
    %   Entradas:
    %     barrierPath - Array de células contendo os índices dos sensores na barreira.
    %     sensors     - Array de sensores disponíveis.
    %     mb_width    - Largura de um bloco de monitoramento.
    %     mb_height   - Altura de um bloco de monitoramento.
    %
    %   Saída:
    %     barrierArea - Área total coberta pelos sensores ao longo da barreira.
    %
    %   Exemplo:
    %     barrierPath = {2, 3, 5, 7}; % Índices dos sensores na barreira
    %     sensors{2}.lowQualityCoveredBlocks = 5;
    %     sensors{2}.mediumQualityCoveredBlocks = 3;
    %     sensors{2}.highQualityCoveredBlocks = 2;
    %     A = computeBarrierArea(barrierPath, sensors, 10, 20);
    %
    %   Autor: Carlos Valadão
    %   Data: 10/02/2025
    
        % Obtém o número total de pontos na barreira
        nPoints = length(barrierPath{1});
    
        % Inicializa a variável de área total
        barrierArea = 0;
    
        % Percorre os sensores ao longo da barreira (excluindo os extremos)
        for k = 2:nPoints-1
            % Obtém o índice real do sensor dentro do array sensors
            sensorIndex = barrierPath{1}(k) - 1;
    
            % Acessa o sensor correto dentro do array de sensores
            sensor = sensors(sensorIndex);
    
            % Calcula a área do sensor e adiciona à área total
            sensorArea = computeSensorArea(sensor, mb_width, mb_height);
            barrierArea = barrierArea + sensorArea;
        end
end
