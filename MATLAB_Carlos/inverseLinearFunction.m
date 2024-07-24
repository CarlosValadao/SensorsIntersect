% inverte uma funcao do primeiro grau, polinomial, obviamente

% Recebe uma funcao assim como representada no matlab
% e devolve o inverso da funcao, na mesma forma que uma
% funcao/polinomio é representado no matlab
% Um vetor de duas posicoes onde a primeira posicao deve ser diferente de zero

function [inverseFunction] = inverseLinearFunction(linearFunction, xDep)
    a = linearFunction(1);
    if a == 0 && xDep
        inverseFunction = linearFunction;
    elseif a == 0 && ~xDep
        inverseFunction = linearFunction;
    elseif a ~= 0 && xDep
        b = linearFunction(2);
        inverseFunction = [ 1/a -(b/a) ];
    else
        error("[inverseLinearFunction] -> SOME ERROR");
    end
end
