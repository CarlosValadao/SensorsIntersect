% Recebe um vetor de dados e um vetor auxiliar, de tal forma que apenas
% as posicoes do vetor auxiliar que guardam 1, serao inseridas no novo vetor,
% na ordem em que sao encontradas, em filledCellVector
% devolve um array, ao inves de um array de celulas

% por exemplo: [ 1 2 3 4 5 ]
%              [ 0 1 0 0 1 ]
% filledCellVector  [ 2 5 ]
% originPositions   [ 2 5 ]

% Nao retorna mais um vetor de celula e nao recebe mais um vetor de celula
% e sim o vetor de qualquer tipo e retorna um vetor do mesmo tipo do de entrada

function [filledCellVector, originPositions] = fillCellVectorWithSelection(cellVec, cellVecAux)
    quantitySelected = nnz(cellVecAux);
    if quantitySelected > 0
        lengthCellVec = length(cellVec);
        idx = 1;
        filledCellVector = repmat(cellVec(1), 1, quantitySelected);
        originPositions = zeros(1, quantitySelected, "uint8");
        for k=1:lengthCellVec
            isSelected = cellVecAux(k) == 1;
            if isSelected
                filledCellVector(idx) = cellVec(k);
                originPositions(idx) = k;
                idx = idx + 1;
            end
        end
    else
        originPositions = [];
        filledCellVector = [];
    end
end