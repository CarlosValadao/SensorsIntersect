% Calcula AQMabs de uma barreira
% Devolve o inteiro que representa
% o AQMabs da barreira
function AQMabs = calcBarrierQuality(sensorsPath, barrierId, sensors, mbWidth, mbHeight)
    path = sensorsPath{barrierId};
    sizeBarrier = length(path) - 1;
    auxAQMabs = 0;
    for k=2:sizeBarrier
        sensor = sensors(path(k)-1);
        numHighQualityBlocksCoverage = length(sensor.highQualityCoveredBlocks);
        numMediumQualityBlocksCoverage = length(sensor.mediumQualityCoveredBlocks);
        numLowQualityBlocksCoverage = length(sensor.lowQualityCoveredBlocks);
        auxAQMabs = auxAQMabs + numHighQualityBlocksCoverage + ...
                (0.75*numMediumQualityBlocksCoverage) + (0.25*numLowQualityBlocksCoverage);
    end
    AQMabs = mbWidth * mbHeight * auxAQMabs;
end