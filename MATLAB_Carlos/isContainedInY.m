% Verifica se o segmento determinado por p1 e p2 estao contido
% no eixo Y, de origem das coordenadas do plano cartesiano
function contains = isContainedInY(p1, p2)
    contains = p1(1) == 0 && p1(2) == 0 && p2(1) == 0 && p2(2) ~= 0;
end