function result = setdiffWithRepetition(A, B)
    % Inicializar o resultado como uma cópia de A
    result = A;
    % Iterar sobre cada elemento de B
    for i = 1:length(B)
        % Encontrar a posição do primeiro elemento de B em result
        idx = find(result == B(i), 1);
        % Se o elemento for encontrado, removê-lo
        if ~isempty(idx)
            result(idx) = [];
        end
    end
end
