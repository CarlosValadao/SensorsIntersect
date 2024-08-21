% Por padrao, o ponto de origem o primeiro
% a ser passado, logo as coordenadas x e y
% do ponto de origem de encontra na posicao dos
% respectivos vetores que guardam essas informacoes
% (coordendas)
% Tudo em radianos
classdef Sensor < PlanarPolygon
    properties (Access = public)
        % sensorXOriginPoint double
        % sensorYOriginPoint double
        Ax
        Ay
        RS
        foVL1Polyshape
        foVL1XV
        foVL1YV
        foVL2Polyshape
        foVL2XV
        foVL2YV
        foVL3Polyshape
        foVL3XV
        foVL3YV

        foVXPoints
        foVYPoints

        foVPolyshapes
        % theta
        % alpha
        % RS
    end

    methods
        % mesma forma de instanciar um poligono planar, mas difere no fato
        % de que algumas informacoes a mais devem ser extraidas e armazenadas
        % alpha e theta em radianos
        function obj = Sensor(A, B, C, theta, alpha, RS)
            % [xVertices, yVertices] = splitXYCoordinates(varargin);
            obj@PlanarPolygon(A, B, C);
            % obj.sensorOriginPoint = A;
            % obj.sensorXOriginPoint = A(1);
            % obj.sensorYOriginPoint = A(2);
            % obj.theta = theta;
            % obj.alpha = alpha;
            obj.RS = RS;
            % AD = AE
            obj.Ax = A(1);
            obj.Ay = A(2);
            Bx = B(1);
            By = B(2);
            Cx = C(1);
            Cy = C(2);

            AD = 0.75 * RS;
            % AF = AG
            AF = 0.5 * RS;
            % obj.Ax
            % obj.Ay
            % AD
            % alpha
            Dx = obj.Ax + AD * cos(alpha);
            Dy = obj.Ay + AD * sin(alpha);
            Ex = obj.Ax + AD * cos(mod(alpha + theta, 2*pi));
            Ey = obj.Ay + AD * sin(mod(alpha + theta, 2*pi));
            Fx = obj.Ax + AF * cos(alpha);
            Fy = obj.Ay + AF * sin(alpha);
            Gx = obj.Ax + AF * cos(mod(theta + alpha, 2*pi));
            Gy = obj.Ay + AF * sin(mod(theta + alpha, 2*pi));

            % [Dx, Dy] = calcCoordinatesPointD(obj.Ax, obj.Ay, AD, alpha);
            % [Ex, Ey] = calcCoordinatesPointE(obj.Ax, obj.Ay, AD, alpha, theta);
            % [Fx, Fy] = calcCoordinatesPointF(obj.Ax, obj.Ay, AF, alpha);
            % [Gx, Gy] = calcCoordinatesPointG(obj.Ax, obj.Ay, AF, alpha, theta);
            obj.foVL1XV = [obj.Ax, Gx, Fx];
            obj.foVL1YV = [obj.Ay, Gy, Fy];
            obj.foVL1Polyshape = polyshape(obj.foVL1XV, obj.foVL1YV);
            obj.foVL2XV = [Gx, Ex, Dx, Fx];
            obj.foVL2YV = [Gy, Ey, Dy, Fy];
            obj.foVL2Polyshape = polyshape(obj.foVL2XV, obj.foVL2YV);
            obj.foVL3XV = [Ex, Cx, Bx, Dx];
            obj.foVL3YV = [Ey, Cy, By, Dy];
            obj.foVL3Polyshape = polyshape(obj.foVL3XV, obj.foVL3YV);
            obj.foVXPoints = [Dx, Ex, Fx, Gx];
            obj.foVYPoints = [Dy, Ey, Fy, Gy];
            obj.foVPolyshapes = [ obj.foVL1Polyshape obj.foVL2Polyshape obj.foVL3Polyshape ];
        end

        function fovL1XVertices = getFoVL1XVertices(obj)
            fovL1XVertices = obj.foVL1Polyshape.Vertices(:,1)';
        end

        function fovL1YVertices = getFoVL1YVertices(obj)
            fovL1YVertices = obj.foVL1Polyshape.Vertices(:,2)';
        end

        function fovL2XVertices = getFoVL2XVertices(obj)
            fovL2XVertices = obj.foVL2Polyshape.Vertices(:,1)';
        end

        function fovL2YVertices = getFoVL2YVertices(obj)
            fovL2YVertices = obj.foVL2Polyshape.Vertices(:,2)';
        end

        function fovL3XVertices = getFoVL3XVertices(obj)
            fovL3XVertices = obj.foVL3Polyshape.Vertices(:,1)';
        end

        function fovL3YVertices = getFoVL3YVertices(obj)
            fovL3YVertices = obj.foVL3Polyshape.Vertices(:,2)';
        end
    end

    % methods (Access = private)
    %     function [x, y] = calcCoordinatesPointD(Ax, Ay, AD, alpha)
    %         fprintf("WHATS WRONG WITH YOU\n");
    %         x = Ax + AD * cos(alpha);
    %         y = Ay + AD * sin(alpha);
    %     end

    %     function [x, y] = calcCoordinatesPointE(Ax, Ay, AD, alpha, theta)
    %         x = Ax + AD * cos(mod(alpha + theta, 2*pi));
    %         y = Ay + AD * sin(mod(alpha + theta, 2*pi));
    %     end

    %     function [x, y] = calcCoordinatesPointF(Ax, Ay, AF, alpha)
    %         x = Ax + AF * cos(alpha);
    %         y = Ay + AF * sin(alpha);
    %     end

    %     function [x, y] = calcCoordinatesPointG(Ax, Ay, AF, alpha, theta)
    %         x = Ax + AF * cos(mod(theta + alpha, 2*pi));
    %         y = Ay + AF * sin(mod(theta + alpha, 2*pi));
    %     end
    % end % end methods private
end