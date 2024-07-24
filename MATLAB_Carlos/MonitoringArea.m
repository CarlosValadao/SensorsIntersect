% Os pontos estao dispostos em ordem horaria
classdef MonitoringArea < handle
    properties (Access = private)
        width uint8
        height uint8
        beta uint8
        xPointCoords double
        yPointCoords double
        % Obrigatoriamente em ordem horaria
        points double
        % Segmentos que formam o poligono
        % array de celulas
        segments cell
    end

    methods
        function obj = MonitoringArea(xorigins, yorigins, width, height, beta)
            obj.width = width;
            obj.height = height;
            obj.beta = beta;
            [obj.xPointCoords, obj.yPointCoords] = calcPointsCoordinates(obj, xorigins, yorigins, ...
                                                                        width, height, beta);
            obj.points = joinXYCoordinates(obj.xPointCoords, obj.yPointCoords);
            obj.segments = generateSegments(obj);
        end

        function xPointCoords = getXPointCoords(obj)
            xPointCoords = obj.xPointCoords;
        end

        function yPointCoords = getYPointCoords(obj)
            yPointCoords = obj.yPointCoords;
        end

        function points = getPoints(obj)
            points = obj.points;
        end

        function segments = getSegments(obj)
            segments = obj.segments;
        end

        function contain = contains(obj, point)
            contain = inpolygon(point(1), point(2), obj.xPointCoords, obj.yPointCoords);
        end

        function width = getWidth(obj)
            width = obj.width;
        end

        function height = getHeight(obj)
            height = obj.height;
        end

        function [parallelToX] = getSegmentsParallelToX(obj)
            parallelToX = [ obj.segments{1} obj.segments{3} ];
        end

        function [parallelToY] = getSegmentsParallelToY(obj)
            parallelToY = [ obj.segments{2} obj.segments{4} ];
        end

        % LF de line formated
        function xPointCoordsLF = getXPointCoordsLF(obj)
            xPointCoordsLF = [ obj.xPointCoords obj.xPointCoords(1) ];
        end

        function yPointCoordsLF = getYPointCoordsLF(obj)
            yPointCoordsLF = [ obj.yPointCoords obj.yPointCoords(1) ];
        end

        function disp(obj)
            fprintf("[%s] ----------------------------", num2str(obj.points(1,:)));
            fprintf("[%s]\n", num2str(obj.points(2,:)));
            fprintf("|\n|\n|\n|\n[%s] ", num2str(obj.points(4,:)));
            fprintf("---------------------------- [%s]\n", num2str(obj.points(3,:)));
        end

        function originPoint = getOriginPoint(obj)
            originPoint = obj.points(4,:);
        end

        function pointOne = getPointOne(obj)
            pointOne = obj.points(1,:);
        end

        function inside = isinside(obj, point)
            inside = inpolygon(point(1), point(2), obj.xPointCoords, obj.yPointCoords);
        end

        function outside = isoutside(obj, point)
        %    outside = ~obj.isinside(obj, point);
            outside = ~inpolygon(point(1), point(2), obj.xPointCoords, obj.yPointCoords);
        end
    end

    methods (Access = private)
        function [xcoords, ycoords] = calcPointsCoordinates(obj, xorigins, yorigins, width, height, beta)
            xcoords = zeros(1, 4, "double");
            xcoords(1) = xorigins;
            xcoords(2) = xorigins + width*cos(beta);
            xcoords(3) = xorigins + (height*sin(beta)) + (width*cos(beta));
            xcoords(4) = xorigins + height*sin(beta);
            obj.xPointCoords = xcoords;
            ycoords = zeros(1, 4, "double");
            ycoords(1) = yorigins;
            ycoords(2) = yorigins + width*sin(beta);
            ycoords(3) = yorigins - (height*cos(beta)) + (width*sin(beta));
            ycoords(4) = yorigins - height*cos(beta);
            obj.yPointCoords = ycoords;
        end

        function segments = generateSegments(obj)
            segments = cell(1, 4);
            segments{1} = Segment(obj.points(1,:), obj.points(2,:), true);
            segments{2} = Segment(obj.points(2,:), obj.points(3,:), false);
            segments{3} = Segment(obj.points(3,:), obj.points(4,:), true);
            segments{4} = Segment(obj.points(1,:), obj.points(4,:), false);
        end
    end
end