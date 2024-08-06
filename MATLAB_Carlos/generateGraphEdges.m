% Esta funcao recebe o lado correspondente, da area de interesse
% monitoringAreaSide, podendo ser:
%               leftSide
%               rightSide
% Recebe tambem um array de indice dos sensores que intersectam ou com
% leftSide ou rightSide
% E devolve um array de celulas 2*sensorIndexesx2, onde cada valor do
% vetor representa um vertice do grafo e os 2 representam uma aresta que
% os contectam, uma vez que o grafo e nao direcionado
% Por ex:
%   monitoringAreaSide = 'leftSide'
%   sensorIndexes = [2, 3]
%   edges = { [2, 3]} => 2 está conectado a 3; 3 está concetada a 2
function edges = generateGraphEdges(monitoringAreaSide, sensorIndexes, numSensors)
    sizeSensorIndexes = length(sensorIndexes);
    edges = zeros(sizeSensorIndexes, 2, "uint8");
    edgesArrow = 1;
    if strcmp(monitoringAreaSide, 'leftSide')
        for k = sensorIndexes
            edges(edgesArrow, 1) = 1;
            edges(edgesArrow, 2) = k;
            edgesArrow = edgesArrow + 1;
        end   
    elseif strcmp(monitoringAreaSide, 'rightSide')
        
    end

end