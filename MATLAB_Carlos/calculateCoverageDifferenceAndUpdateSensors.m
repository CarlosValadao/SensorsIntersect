%% calculateCoverageDifferenceAndUpdateSensors
% Calcula a diferença de cobertura entre sensores e atualiza suas regiões monitoradas.
%
% Esta função percorre um conjunto de sensores, comparando sua cobertura com
% os demais sensores para redistribuir os blocos monitorados, garantindo
% uma cobertura mais equilibrada.
%
% Parâmetro:
%   - sensors: Vetor contendo os sensores a serem analisados.
%
% Autor: Carlos Valadão
% Data: 10/02/2025

function calculateCoverageDifferenceAndUpdateSensors(sensors)
    numSensors = length(sensors); % Número total de sensores
    % Percorre todos os sensores
    for k = 1:numSensors-1
        for l = 1:numSensors
            % Evita comparar um sensor com ele mesmo
            if k ~= l
                updateSensorCoverageDifference(sensors(k), sensors(l)); % Atualiza cobertura
            end
        end
    end
end
