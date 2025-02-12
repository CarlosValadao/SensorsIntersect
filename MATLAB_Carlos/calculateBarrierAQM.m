function AQM = calculateBarrierAQM(barrier, sensors, mb_width, mb_height, area)
    % calculateBarrierAQM calcula o índice de qualidade do ar (AQM) para uma barreira
    % com base na área da barreira e na medida de AQM calculada para os sensores.
    % 
    % Parâmetros de entrada:
    %   barrier: Vetor com os índices dos sensores cobertos pela barreira.
    %   sensors: Estrutura contendo dados dos sensores, incluindo coberturas de blocos de diferentes qualidades.
    %   mb_width: Largura da área da barreira.
    %   mb_height: Altura da área da barreira.
    %   area: A área total onde os sensores estão cobrindo.
    %
    % Retorna:
    %   AQM: O índice de qualidade do ar calculado, levando em consideração a área.

    % Chama a função calculateBarrierAQMabs para obter o AQM absoluto
    AQMabs = calculateBarrierAQMabs(barrier, sensors, mb_width, mb_height);
    
    % Calcula o AQM normalizado dividindo o AQM absoluto pela área
    AQM = AQMabs / area;
end
