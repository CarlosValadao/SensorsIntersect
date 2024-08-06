function paths = findAllPaths(adjMatrix, startNode, endNode)
    % Inicializa a lista de caminhos como uma célula vazia
    paths = {};
    % Chama a função auxiliar de deepFirstSearch para encontrar todos os caminhos
    paths = deepFirstSearch(adjMatrix, startNode, endNode, [], paths);
end

function paths = deepFirstSearch(adjMatrix, currentNode, endNode, path, paths)
    % Adiciona o nó atual ao caminho
    path = [path, currentNode];
    
    % Verifica se chegamos ao nó de destino
    if currentNode == endNode
        % Adiciona o caminho encontrado à lista de caminhos
        paths{end+1} = path;
    else
        % Obtém os vizinhos do nó atual
        neighbors = find(adjMatrix(currentNode, :) == 1);
        
        % Percorre cada vizinho
        for i = 1:length(neighbors)
            neighbor = neighbors(i);
            % Verifica se o vizinho já está no caminho (para evitar ciclos)
            if ~ismember(neighbor, path)
                paths = deepFirstSearch(adjMatrix, neighbor, endNode, path, paths);
            end
        end
    end
end
