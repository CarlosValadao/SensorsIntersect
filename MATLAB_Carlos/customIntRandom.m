% Devolve um inteiro x tal que 0 < x < iMax
% x esta entre start e end e nao esta contido
% em auxArray
function intRandom = customIntRandom(iMax, auxArray)
    intRandom = randi(iMax, 1);
    while ismember(intRandom, auxArray)
        intRandom = randi(iMax, 1)
    end
end