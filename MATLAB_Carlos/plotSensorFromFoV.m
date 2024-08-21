% Plota um sensor a partir de seus FoVs
% l1, l2 e l3
function plotSensorFromFoV(sensor)
    % HIGH COVERAGE QUALITY
    verdeSuave = [0.5, 0.8, 0.5];   % Verde não tão intenso
    % MEDIUM COVERAGE QUALITY
    amareloSuave = [1.0, 1.0, 0.6]; % Amarelo não tão intenso
    % LOW COVERAGE QUALITY
    vermelhoSuave = [1.0, 0.6, 0.6]; % Vermelho não tão intenso
    plot(sensor.foVL1Polyshape, 'FaceColor', verdeSuave, 'EdgeColor', 'none');
    plot(sensor.foVL2Polyshape, 'FaceColor', amareloSuave, 'EdgeColor', 'none');
    plot(sensor.foVL3Polyshape, 'FaceColor', vermelhoSuave, 'EdgeColor', 'none');
end