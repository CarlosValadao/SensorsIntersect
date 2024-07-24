% Fazer verificacao para quando os arrays possuem tamanhos diferentes
% para retornar um erro

% Recebe dois vetores de coordenadas x e y
% v1 = [ x(1) x(2) ... x(n) ]
% v2 = [ y(1) y(2) ... y(n) ]
% retorna R = { [x(1) y(1)] [x(2) y(2)] ... [x(n) y(n)] } um array de células
function [coordinates] = joinXYCoordinates(xcoords, ycoords)
    lxcoords = length(xcoords);
    coordinates = zeros(lxcoords, 2);
    for k=1:lxcoords
        coordinates(k,:) = [ xcoords(k) ycoords(k) ];
    end
end
