% Faz a intersecao completa entre dois poligonos e retorna
% o poligono intersecao em xVertices, as coordenadas x dos pontos de intersecao
% e yVertice, as coordenadas y dos pontos de intersecao, e hasIntersection
% e um valor booleano, assume verdadeiro caso exista a intersecao e false
% caso contrario

% Devolve as coordenadas do novo poligono no sentido anti-horario
function [hi, newPolygon] = interPolygon(polygonOrign, polygonDest)
    % Fazer a verificacao de erro para quando nao existir intersecao entre os poligonos
    % se bem que essa verificacao sera feita por outra funcao, mas eu acredito que sera uma
    % boa pratica faze-la aqui tambem (AINDA FALTA FAZER)
    [hasIntersection, xVertices, yVertices] = getFullPlanarPolygonIntersection(polygonOrign, polygonDest);
    % xVertices
    % yVertices
    % Aqui pode ocorrer um erro se os sensores estiverem
    % o mesmo ponto de origem
    if hasIntersection
        k = convhull(xVertices, yVertices);
        xVertices = xVertices(k);
        yVertices = yVertices(k);

        % Faz a juncao das coordenadas x e y dos vertices
        % em um array de celulas
        lenXVertices = length(xVertices);
        newPolygonVertices = cell(1, lenXVertices-1);
        for k=1:lenXVertices-1
            newPolygonVertices{k} = [ xVertices(k) yVertices(k) ];
        end
        hi = hasIntersection;
        newPolygon = PlanarPolygon(newPolygonVertices{:});
    else
        hi = hasIntersection;
        newPolygon = [];
        % error("[INTER POLYGON] -> OS POLIGONOS NAO SE INTERSECTAM");
    end
end