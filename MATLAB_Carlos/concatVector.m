% Concatena dois ou mais vetores,
% na mesma ordem em que foram passados
% para a funcao
function concat = concatVector(varargin)
    concat = [ varargin{:} ];
end