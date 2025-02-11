function area = computeSensorArea(sensor, mb_width, mb_height)
    % COMPUTESENSORAREA Calcula a área total coberta por um sensor.
    %   area = COMPUTESENSORAREA(sensor, mb_width, mb_height) retorna a área
    %   total monitorada pelo sensor, considerando os blocos cobertos.
    %
    %   Entradas:
    %     sensor   - Estrutura contendo informações sobre os blocos monitorados.
    %     mb_width - Largura de um bloco de monitoramento.
    %     mb_height - Altura de um bloco de monitoramento.
    %
    %   Saída:
    %     area - Área total coberta pelo sensor.
    %
    %   Exemplo:
    %     sensor.lowQualityCoveredBlocks = [1, 2, 3, 4, 5];
    %     sensor.mediumQualityCoveredBlocks = [6, 7, 8];
    %     sensor.highQualityCoveredBlocks = [9, 10];
    %     A = computeSensorArea(sensor, 10, 20); % Retorna 2000
    %
    %   Autor: Carlos Valadão
    %   Data: 10/02/2025
    
        % Obtém a quantidade de blocos monitorados em cada categoria
        lowQBlocks = length(sensor.lowQualityCoveredBlocks);
        medQBlocks = length(sensor.mediumQualityCoveredBlocks);
        highQBlocks = length(sensor.highQualityCoveredBlocks);
    
        % Calcula o total de blocos monitorados
        totalMonitoringBlocks = lowQBlocks + medQBlocks + highQBlocks;
    
        % Calcula a área total coberta pelo sensor
        area = mb_width * mb_height * totalMonitoringBlocks;
end
    