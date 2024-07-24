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

% Assumindo que p1Sensor < p2Sensor, em termos de coordenadas

% De forma generica essa funcao recebe um segmento de reta e suas equacoes e um poligono definido
% por um conjunto de pontos em ordem horaria ou antihoraria e retorna as novas coordenadas do segmento de
% reta que estao dentro do polígono, "descartando a parte que está fora do polígono
% na forma de newP e newQ, novos P e Q que determinam a parte de dentro deste segmento de reta
% Caso o segmento de reta esteja totalmente dentro do polígono, então newP e newQ guarda o mesmo
% valor de p1Sensor e p2Sensor (melhorar estes nomes)


% A area de interese sera mapeada como uma struct
% a struct contera campos que guardarao as informacoes das coordenadas
% dos pontos que compoem o poligono que formam a area de interesse, em ordem
% horaria, bem como as informacoes dos segmentos de reta que compoem esse poligono
% e as equacoes de reta
%   struct
%   MonitoringArea.xPointCoords = [];
%   MonitoringArea.yPointCoords = [];
%   MonitoringArea.segment1 = segment<struct>;
%   MonitoringArea.segmentn = segment<struct>;


% Verificara todos os possíveis lados do polígono e as possíveis interseção nessa função
% [ Talvez esteja fazendo coisas demais ;-; ]

% uma vez que se ocorrer uma interseção é impossível ocorrêla em outra parte do polígono (ou não)
% é melhor verificar em todos os lados, mesmo

function getSubsegmentInsideMonitoringArea(sensorSegment, monitoringArea)
    updateSegmentPointsInsideMonitoringArea(sensorSegment, monitoringArea);
end
