% Verifica se um dado sensor faz interseção com a area de interesse
% se sim retorna verdade e as coordenadas em x e y, caso contrario
% retorna false e as coordenadas vazias, um array vazio

% A funcao vai gerar as equacoes constantes, bem como os pontos, de forma interna
% vou criar uma funcao para gerar os 4 pontos e retornar eles dois arrays
% o array das coordenadas x e o array das coordenadas y :)
% As equacoes da area de interesse vem na forma de um vetor de celulas de tamanho 4
% Assumindo 1 = p1, 2 = p2 e analogamente para o restante

%(1)-> p1p2
%(2)-> p2p4
%(3)-> p3p4
%(4)-> p3p1

% Um sensor possui o seguinte esqueleto
% -> (1) sensor.angle
% -> (2) sensor.POV
% -> (3) sensor.RS
% -> (4) sensor.Ax
% -> (5) sensor.Ay
% -> (6) sensor.Bx
% -> (7) sensor.By
% -> (8) sensor.Cx
% -> (9) sensor.Cy
% -> (10) sensor.dist
% -> (11) sensor.ABLineEq
% -> (12) sensor.ACLineEq
% -> (13) sensor.BCLineEq
% -> (14) sensor.ABSegment
% -> (15) sensor.ACSegment
% -> (16) sensor.BCSegment

% Assume que o sensor esta parcialmente contido na area de monitoramento

% :IDEIA: A parte da linha 47 ate 61 deve virar uma funcao, esta
% funcao deve receber, os pontos dos segmentos de reta e as equacoes
% e as coordenadas x e y dos pontos que determinam a area de interesse
% e vai retornar os novos pontos que determinam o novo segmento de reta
% da reta AB/AC. (dois pontos)


function [hasIntersection, xcoords, ycoords] = getMonitoringAreaIntersectionPoints(sensor, MAequations, ...
                                                                                   MAxcoords, MAycoords)
    [p1p2, p2p4, p3p4, p3p1] = MAequations{:};
    MAPoints = joinXYCoordinates(MAxcoords, MAycoords);
    [MAp1, MAp2, MAp3, MAp4] = MAPoints{:};
    sensorAPoint = sensor.ABSegment(1:1, 1:2);
    sensorBPoint = sensor.ABSegment(2:2, 1:2);
    sensorCPoint = sensor.ACSegment(2:2, 1:2);
    sensorABLineEq = sensor.ABLineEq;
    sensorACLineEq = sensor.ACLineEq;
    % sensorBCLineEq = sensor.BCLineEq;
    [hasIntersection, xInter, yInter] = getSegmentsIntersectionLE(sensorAPoint, sensorBPoint, ...
                                                    MAp1, MAp2, sensorABLineEq, p1p2);
    if hasIntersection
        if ~inpolygon(sensor.Ax, sensor.Ay, MAxcoords, MAycoords)
            sensor.Ax = xInter;
            sensor.Ay = yInter;
            sensor.ABSegment(1,1) = [ xInter yInter ];
        else
            sensor.Bx = xInter;
            sensor.By = yInter;
            sensor.ABSegment(1,2) = [ xInter yInter ];
        end
    end
end
