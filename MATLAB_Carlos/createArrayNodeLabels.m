% Essa funcao cria os nomes dos nos de cada no de um dado
% grafo com base em - prefix - e nodeQuantity -,
% seguindo o seguinte formato: prefixNodeQuantity de zero ate
% NodeQuantity, claro, incluindo L e R, o lado esquerdo e direito
% da area de monitoramento
% por exemplo:
% prefix = "s", nodeQuantity = 2
% ["L", s1", "s2", "R" ]
function labels = createArrayNodeLabels(prefix, nodeQuantity)
    labels = strings(1, nodeQuantity+2);
    labels(1) = "L";
    for k=2:nodeQuantity+1
        labels(k) = sprintf("%s%d", prefix, k-1);
    end
    labels(k+1) = "R";
end