% Devolve se o bloco de monitoramento esta contido no sensor
% e qual a qualidade de cobertura do sensor sobre o bloco
% de monitoramento
function [isInside, coverageQuality] = monitoringBlockInSensor(monitoringBlock, sensor)
    foVL1XV = sensor.foVL1XV;
    foVL1YV = sensor.foVL1YV;
    foVL2XV = sensor.foVL2XV;
    foVL2YV = sensor.foVL2YV;
    foVL3XV = sensor.foVL3XV;
    foVL3YV = sensor.foVL3YV;
    xBaricenter = monitoringBlock.xBaricenter;
    yBaricenter = monitoringBlock.yBaricenter;
    monitoringBlockInsideFoV1 = inpolygon(xBaricenter, yBaricenter, foVL1XV, foVL1YV);
    monitoringBlockInsideFoV2 = inpolygon(xBaricenter, yBaricenter, foVL2XV, foVL2YV);
    monitoringBlockInsideFoV3 = inpolygon(xBaricenter, yBaricenter, foVL3XV, foVL3YV);
    if monitoringBlockInsideFoV1
        coverageQuality = 1;
        isInside = true;
    elseif monitoringBlockInsideFoV2
        coverageQuality = 2;
        isInside = true;
    elseif monitoringBlockInsideFoV3
        coverageQuality = 3;
        isInside = true;
    else
        coverageQuality = -1;
        isInside = false;
    end
end