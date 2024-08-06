% Verifica a interseção entre dois sensores e retorna o ponto onde eles
% se intersectaram, tomando como verdade que os sensores se intersectam
% em apenas um ponto
% point é um array que contém as coordenadas x e y do pontos de interseção
% de sensor1 com sensor2 => point = [x y]
% point é vazio [] caso os sensores não se intersectam
% hasSensorsIntersection é 1 caso haja uma interseção entre as retas
% que descrevem os sensores e 0 CC

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


% não imterrompe a execução da função ao encontrar a primeira interseção entre
% os segmentos de reta

function [hasIntersection, x, y] = getSensorsIntersection(sensor1, sensor2)
    sensor1Segments = sensor1.getSegments();
    sensor2Segments = sensor2.getSegments();
    % s1ArrayProps = struct2cell(sensor1);
    % s2ArrayProps = struct2cell(sensor2);
    % disp("ARRAY PROPS");
    % cell2mat(s1ArrayProps(14))
    % cell2mat(s2ArrayProps(14))
    % disp(cell2mat(s1ArrayProps(11)));
    % s1ArrayProps = arrayfun(@(e) cell2mat(e), s1ArrayProps);
    % s2ArrayProps = arrayfun(@(e) cell2mat(e), s2ArrayProps);
    idx = 1;
    x = [];
    y = [];
    for k = 1:sensor1.getNVertices()
        for l = 1:sensor2.getNVertices()
            % p = cell2mat(s1ArrayProps(k));
            % p1 = p(1,:);
            % p2 = p(2,:);
            % q = cell2mat(s2ArrayProps(l));
            % q1 = q(1,:);
            % q2 = q(2,:);
            % [hasIntersection, x1, y1] = getSegmentsIntersection(p1, p2, q1, q2);
            [hasIntersection, x1, y1] = getSegmentsIntersection(sensor1Segments{k}, sensor2Segments{l});
            if hasIntersection
                if length(x1) > 1
                    x(idx) = x1(1);
                    y(idx) = y1(1);
                    y(idx+1) = y1(2);
                    x(idx+1) = x1(2);
                    idx = idx + 2;
                else
                    x(idx) = x1;
                    y(idx) = y1;
                    idx = idx + 1;
                end
            end
        end
        
    end
    % Nao lembro o motivo desse if
    % mas tem uma boa razao e nao e armengue
    if (length(x) >= 2 && length(y) >= 2) || (length(x) == 1 && length(y) == 1)
        % disp("INTERPOINT")
        % x
        % y
        hasIntersection = true;
    else
        hasIntersection = false;
        x = [];
        y = [];
    end
end

% x e y sairao como dosi vetores de celula 