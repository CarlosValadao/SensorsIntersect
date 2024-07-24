% Esqueci o motivo do d, talvez seja porque ja existe
% uma outra funcao chamada getLineEquation
% ->
function [lineEq] = getLineEquationd(p1, p2)
    % Como a equacao sempre sera de uma reta, o vetor
    % que representa o polinomio tera tamanho 2, no maximo
    % logo, sera adicionado, como flag, 1 ao final do vetor
    % indicando que aquele polinomio depende de y.
    % Caso o contrario o polinomio permanecera inalterado
    Y_DEPENDS = 1;
    if isContainedInY(p1, p2)
        lineEq = [0 p2(2) Y_DEPENDS ];
    elseif isyconstfunc(p1, p2)
        lineEq = [ 0 p1(1) Y_DEPENDS ];
    else
        % a = (p1(2)-p2(2))/(p1(1)-p2(1));
        % b = p2(2) - p2(1)*a;
        lineEq = [ ( (p1(2)-p2(2))/(p1(1)-p2(1)) ) ( p2(2)-(p2(1)*(p1(2)-p2(2))/(p1(1)-p2(1))) ) ];
        % lineEq = [ a b ];
    end
end