% Recebe um array de celula contendo, em cada celula um
% vetor de double de duas posicoes, e separa em dois arrays
% de double, xcoords e ycoords, coordenadas x e y de cada ponto
% respectivamente, de acordo com a ordem em que eles estao dispostos
% em points
function [xcoords, ycoords] = splitXYCoordinates(points)
    % lengthPoints = length(points);
    % xcoords = zeros(1, lengthPoints, "double");
    % ycoords = zeros(1, lengthPoints, "double");
    % for k=1:lengthPoints
    %     point = points{k};
    %     xcoords(k) = point(1);
    %     ycoords(k) = point(2);
    % end
    pointsMatrix = vertcat(points{:});
    xcoords = pointsMatrix(:,1);
    xcoords = xcoords';
    ycoords = pointsMatrix(:,2);
    ycoords = ycoords';
end
