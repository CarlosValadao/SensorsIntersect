% plota o poligono correspondente da barreira cujo o id e
% barrierId, com base nos caminhos possiveis contidos
% no vetor de celula sensorsPaths.
% sensors e o array que contem todos os sensores, e monitoringArea
% e o PlanarPolygon que representa a area de monitoramento
function plotDefinedPolygonBarrier(sensorsPaths , barrierId, sensors, monitoringArea)
    setupPlot();
    plotMonitoringArea(monitoringArea);
    barrierPolygon = growingPoly(sensorsPaths{barrierId}, sensors);
    plot(barrierPolygon);
    customPolygonBarrierTitle = sprintf("Polígono correspondente a barreira n° %s", ...
    num2str(barrierId));
    title(customPolygonBarrierTitle);
end