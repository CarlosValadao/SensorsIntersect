% Deprecated
% Deprecated
classdef Sensor < handle
    properties (Access = private)
        angle
        POV
        RS
        A
        B
        C
        dist
        % Segment.m
        ABSegment
        ACSegment
        BCSegment
    end

    methods
        function obj = Sensor(angle, POV, RS, Ax, Ay)
            obj.angle = angle;
            obj.POV = POV;
            obj.RS = RS;
            obj.A = [Ax Ay];
            % Apenas deve ter a definicao das coordenadas x e y
            % dos pontos A, B e C e depois a definicao dos segmentos
            % O ponto B e calculado em funcao de Ax, Ay, RS e angle
            % O ponto C e calculado em funcao de Ax, Ay, RS, angle e POV
            obj.B = [ (Ax + RS*cos(angle)) (Ay + RS*sin(angle)) ];
            obj.C = [ (Ax + RS*cos(mod(angle + POV, 2*pi))) (Ay + RS*sin(mod(angle + POV, 2*pi))) ];
            obj.dist = sqrt(Ax*Ax + Ay*Ay);
            obj.ABSegment = Segment(obj.A, obj.B, true);
            obj.ACSegment = Segment(obj.A, obj.C, true);
            obj.BCSegment = Segment(obj.B, obj.C, true);
        end

        function ABSegment = getABSegment(obj)
            ABSegment = obj.ABSegment;
        end

        function obj = setABSegment(obj, segment)
            obj.ABSegment = segment;
        end

        function ACSegment = getACSegment(obj)
            ACSegment = obj.ACSegment;
        end

        function obj = setACSegment(obj, segment)
            obj.ACSegment = segment;
        end

        function BCSegment = getBCSegment(obj)
            BCSegment = obj.BCSegment;
        end

        function obj = setBCSegment(obj, segment)
            obj.BCSegment = segment;
        end

        function obj = setAPoint(obj, A)
            obj.A = A;
        end

        function APoint = getAPoint(obj)
            APoint = obj.A;
        end

        function obj = setBPoint(obj, B)
            obj.B = B;
        end

        function BPoint = getBPoint(obj)
            BPoint = obj.B;
        end

        function obj = setCPoint(obj, C)
            obj.C = C;
        end

        function CPoint = getCPoint(obj)
            CPoint = obj.C;
        end

        % Distancia em relacao a origem do sistema
        % de coordenadas (0, 0)
        function dist = getDist(obj)
            dist = obj.dist;
        end

        % Retorna a distancia em relacao a um ponto
        % Considerando que o ponto que representa
        % um sensor e o ponto A, pois a partir dele
        % sao gerados os pontos B e C
        function distance = getDistance(obj, point)
            pointx = point(1);
            pointy = point(1);
            ax = obj.A(1);
            ay = obj.A(2);
            distance = sqrt(power(pointx - ax, 2) + power(pointy - ay, 2));
        end

        % LF = Line formatado, formatado para o comando linxe
        % pois ha uma repeticao em xcoords(1) ou ycoords(1) ao final do vetor

        function xCoords = getXPointCoordsLF(obj)
            xCoords = getxcoord(obj.A, obj.B, obj.C);
            xCoords = [ xCoords, xCoords(1) ];
        end

        function yCoords = getYPointCoordsLF(obj)
            yCoords = getycoord(obj.A, obj.B, obj.C);
            yCoords = [ yCoords, yCoords(1) ];
        end

        function segments = getSegments(obj)
            segments = [ obj.ABSegment, obj.ACSegment, obj.BCSegment ];
        end

        function disp(obj)
            fprintf("\t\tSensor\n");
            disp(['angle     -> ', num2str(obj.angle)]);
            disp(['POV       -> ', num2str(obj.POV)]);
            disp(['RS        -> ', num2str(obj.RS)]);
            disp(['A         -> [', num2str(obj.A),']']);
            disp(['B         -> [', num2str(obj.B),']']);
            disp(['C         -> [', num2str(obj.C), ']']);
            disp(['dist      -> ', num2str(obj.dist)]);
            fprintf("\n");
            disp('| ABSegment ->  |');
            disp(num2str(obj.ABSegment.fdisp()));
            disp('| ACSegment ->  |');
            disp(num2str(obj.ACSegment.fdisp()));
            disp('| BCSegment ->  |');
            disp(num2str(obj.BCSegment.fdisp()));
            % disp(['ACSegment -> ', num2str(obj.ACSegment.fdisp())]);
            % disp(['BCSegment -> ', num2str(obj.BCSegment.fdisp())]);
        end

    end
end