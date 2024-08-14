% gera um conjunto de sensores com base
% inputMethod, se for "FromUser" a geracao
% dos sensores sera via mouse
% caso "NotFromUser" a geracao dos sensores
% se dara de forma aleatoria pelo computador
% Devolve um array contendo a quantidade de sensores
% - numSensors -
function sensors = generateSensors(inputMethod, pOV, monitoringAreaHeigth, monitoringAreaWidth, rS, nSensors, ...
                                    monitoringArea)
    if inputMethod == "FromUser"
        setupPlot();
        plotMonitoringArea(monitoringArea);
        sensors = placeSensorsFromUser(nSensors, nSensors, pOV, rS);
        close;
    elseif inputMethod == "NotFromUser"
        sensors = randomNSensors(pOV, monitoringAreaHeigth, monitoringAreaWidth, rS, nSensors);
    else
        error("INVALID INPUT_METHOD");
    end
end