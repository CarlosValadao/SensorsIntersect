% classe que representa um segmento de reta
% startPoint e um array de double de duas posicoes
% endPoint e um array de double de duas posicoes
% lineEquation e um array de double, da mesma forma
% que o matlab utiliza os arrays para repersentar um polinomio
% xDepend e utilizado para verificar se aquele polinomio depende de x
% quando x assume true ou nao (y no caso), quando xDepend assume false
classdef Segment < handle
    properties (Access = private)
        startPoint
        endPoint
        lineEquation
        xDepend logical
    end

    methods
        %xDepend pode ser apenas verdadeiro ou falso
        function obj = Segment(startPoint, endPoint)
            [obj.startPoint, obj.endPoint] = sortPoints(startPoint, endPoint);
            % Faz as alteracoes necessarias com base na flag
            % definida em getLineEquationd
            LE = getLineEquationd(startPoint, endPoint);
            if length(LE) > 2
                LE(3) = [];
                obj.xDepend = false;
            else
                obj.xDepend = true;
            end
            obj.lineEquation = LE;
        end

        function lineEquation = getLineEquation(obj)
            lineEquation = obj.lineEquation;
        end

        function obj = setLineEquation(obj, lineEquation)
            obj.lineEquation = lineEquation;
        end
        
        function obj = setStartPoint(obj, startPoint)
            obj.startPoint = startPoint;
        end

        function startPoint = getStartPoint(obj)
            startPoint = obj.startPoint;
        end

        function obj = setEndPoint(obj, endPoint)
            obj.endPoint = endPoint;
        end

        function endPoint = getEndPoint(obj)
            endPoint = obj.endPoint;
        end

        % Nao ha como ocorrer segmentos paralelos
        % ou ao eixo x ou ao eixo y
        function contains = contains(obj, point)
            if isyconstfunc(obj.startPoint, obj.endPoint)
                contains = obj.endPoint(1) == point(1) && point(2) >= obj.startPoint(2) && point(2) <= obj.endPoint(2);
                obj.endPoint(1) == point(1)
                point(2) >= obj.startPoint(2) && point(2) <= obj.endPoint(2)
            elseif isxconstfunc(obj.startPoint, obj.endPoint)
                contains = obj.endPoint(2) == point(2) && point(1) >= obj.startPoint(1) && point(2) <= obj.endPoint(1);
            else
                eps = 1e-5;
                tx = (point(1)-obj.startPoint(1))/(obj.endPoint(1)-obj.startPoint(1));
                ty = (point(2)-obj.startPoint(2))/(obj.endPoint(2)-obj.startPoint(2));
                abstxty = abs(tx-ty);
                if abstxty < eps
                    contains = tx >= 0 && tx <= 1;
                else
                    contains = false;
                end
            end
        end

        function xcoords = getXCoords(obj)
            xcoords = getxcoord(obj.startPoint, obj.endPoint);
        end

        function ycoords = getYCoords(obj)
            ycoords = getycoord(obj.startPoint, obj.endPoint);
        end

        function xDepend = isXDependent(obj)
            xDepend = obj.xDepend;
        end

        function yDepend = isYDependent(obj)
            yDepend = ~obj.xDepend;
        end

        function disp(obj)
            fprintf("\t\tSegment\n");
            disp(num2str(obj.fdisp()));
            % disp(['startPoint   -> [', num2str(obj.startPoint), ']']);
            % disp(['endPoint     -> [', num2str(obj.endPoint), ']']);
            % disp(['LineEquation -> [', num2str(obj.lineEquation), ']']);
            % disp(['xDepend      -> ', num2str(obj.xDepend)]);
        end

        function sdisp = fdisp(obj)
            sdisp = sprintf("startPoint   -> [%s]\nendPoint     -> [%s]\nLineEquation -> [%s]\nxDepend      -> [%s]\n", ...
                    num2str(obj.startPoint), num2str(obj.endPoint), num2str(obj.lineEquation), num2str(obj.xDepend));
        end
    end
end