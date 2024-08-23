% Calcula a intersecao de dois sensores
% levando em consideracao os blocos de monitoramento
% assistidos pelos sensores
% Devolve os dois sensores atualizados, com novos
% blocos de monitoramento

% WARNING
% Essa funcao assume que os sensores se intersectam,
% os poligonos que os definem, caso contrario ocorrera
% um erro inesperado
function [nSensorA, nSensorB] = getSensorsIntersectionFromMonitoringBlocks(sensorA, sensorB)
    fovSensorAPolyshapes = sensorA.foVPolyshapes;
    fovSensorBPolyshapes = sensorB.foVPolyshapes;
    for foVALevel=1:3
        for foVBLevel=1:3
            if foVALevel ~= foVBLevel
                intersectionFovPolyshape = intersect(fovSensorAPolyshapes(foVALevel), ...
                                                    fovSensorBPolyshapes(foVBLevel));
                intersectionFovPolyshapeXV = intersectionFovPolyshape.Vertices(:,1);
                intersectionFovPolyshapeYV = intersectionFovPolyshape.Vertices(:,2);
                if ~isempty(intersectionFovPolyshape)
                    if foVALevel < foVBLevel
                        monitoringBlocksInsideFov = sensorB.coveredBlocks{foVBLevel};
                        for monitoringBlock=monitoringBlocksInsideFov
                            xBaricenter = monitoringBlock.xBaricenter;
                            yBaricenter = monitoringBlock.yBaricenter;
                            isMonitoringBlockInInterFovPolyshape = inpolygon(...
                                                    xBaricenter, yBaricenter, ...
                                                    intersectionFovPolyshapeXV, ...
                                                    intersectionFovPolyshapeYV);
                            if isMonitoringBlockInInterFovPolyshape
                                sensorB.removeBlockCoverage(foVBLevel, monitoringBlock);
                            end
                        end
                    elseif foVALevel > foVBLevel
                        monitoringBlocksInsideFov = sensorA.coveredBlocks{foVALevel};
                        for monitoringBlock=monitoringBlocksInsideFov
                            xBaricenter = monitoringBlock.xBaricenter;
                            yBaricenter = monitoringBlock.yBaricenter;
                            isMonitoringBlockInInterFovPolyshape = inpolygon(...
                                                    xBaricenter, yBaricenter, ...
                                                    intersectionFovPolyshapeXV, ...
                                                    intersectionFovPolyshapeYV);
                            if isMonitoringBlockInInterFovPolyshape
                                sensorA.removeBlockCoverage(foVALevel, monitoringBlock);
                            end
                        end
                    end
                end
            end
        end
    end
    nSensorA = sensorA;
    nSensorB = sensorB;
end
