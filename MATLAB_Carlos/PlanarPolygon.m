% Representa um poligono convexo, não convexo ou regular, planar
% de tal forma que os seus pontos (vertices) devem ser
% fornecidos no sentido horario, uma vez que todo poligono
% possui nvertices >= 3


% Uma vez que todo sensor tambem e um poligono planar
% o ponto A sempre sera o primeiro, pelo motivo da hierarquia
% ou seja, ele e o ponto principal e referencia, utilizado para o
% calculo de distancia e outros calculos
%
% Analisando o codigo e possivel verificar que na classe Sensor
% POV e RS e utilizado apenas nos calculos e depois nao sao utilizados
% no restante das operacoes

classdef PlanarPolygon < handle
    properties (Access = public)
        xvertices double
        yvertices double
        vertices cell
        sides cell
        nvertices uint8
    end

    methods
        % Construtor, assumindo que os vertices estao dispostos
        % em sentido horario
        function obj = PlanarPolygon(varargin)
            if nargin >= 3
                obj.vertices = varargin;
                [obj.xvertices, obj.yvertices] = splitXYCoordinates(varargin);
                obj.nvertices = nargin;
                obj.sides = generateSides(obj, varargin);
                %obj.sides = generateSides(varargin);
            else
                error("[ERROR] -> nvertices shoud be more than 2");
            end
        end

        % verifica se um dado ponto [x y] esta contido no
        % poligono
        % retorna verdadeiro caso esteja contido e falso
        % caso contrario
        function inside = isinside(obj, point)
            inside = inpolygon(point(1), point(2), obj.xvertices, obj.yvertices);
        end

        function outside = isoutside(obj, point)
            outside = ~(obj.isinside(point));
        end

        function segments = getSegments(obj)
            segments = obj.sides;
        end

        function vertices = getVertices(obj)
            vertices = obj.vertices;
        end

        function pointsCoord = getXPointCoords(obj)
            pointsCoord = obj.xvertices;
        end

        function pointsCoord = getXPointCoordsLF(obj)
            pointsCoord = [obj.xvertices, obj.xvertices(1) ];
        end

        function pointsCoord = getYPointCoords(obj)
            pointsCoord = obj.yvertices;
        end

        function pointsCoord = getYPointCoordsLF(obj)
            pointsCoord = [ obj.yvertices, obj.yvertices(1) ];
        end

        function nuvertices = getNVertices(obj)
            % obj.nvertices
            nuvertices = obj.nvertices;
        end

        function vertices = getXVertices(obj)
            vertices = obj.xvertices;
        end

        function vertices = getYVertices(obj)
            vertices = obj.yvertices;
        end

        % Devolve determinado vertice localizado na posicao
        % idx da lista de vertices
        function vertex = getVertex(obj, idx)
            vertex = obj.vertices{idx};
        end

        % Retorna a distancia euclidiana entre o ponto de origem
        % do poligono e um outro ponto qualquer
        function distance = getDistance(obj, point)
            pointx = point(1);
            pointy = point(2);
            originVertex = obj.vertices{1};
            distance = sqrt(power(pointx - originVertex(1), 2) + power(pointy - originVertex(2), 2));
        end

        function isVertexPoint = isVertex(obj, point)
            nVertices = obj.nvertices;
            vertice = obj.vertices;
            isVertexPoint = false;
            for k=1:nVertices
               polygonVertex = vertice{k};
               % comparacao de poontos
               samePoint = polygonVertex(1) == point(1) && polygonVertex(2) == point(2);
               if samePoint
                   isVertexPoint = true;
                   return;
               end
            end

        end

        % Devolve uma matriz 2x2, onde cada linha da matriz
        % representa um vertice (ponto)
        function verticesAsMatrix = getVerticesAsMatrix(obj)
            verticesAsMatrix = vertcat(obj.vertices{:});
        end

        function isNotVertexPoint = isNotVertex(obj, point)
            isNotVertexPoint = ~(obj.isVertex(point));
        end
        % iseq e uma variavel booleana
        % compara dois poligonos com base nas posicoes
        % de seus vertices no plano cartesiano
        % para que haja uma comparacao, e necessario que os poligonos
        % possuam a mesma quantidade de lados, logo a mesma quantidade
        % de vertices

        % verifica se todos os vertices de polygondest sao os mesmos
        % de polygon (obj)

        % -> Corrigir a parte que equalVerticeQuantity e sempre verdadeiro
        function samePolygon = eq(obj, polygonDest)
            polygonDestNVertices = polygonDest.getNVertices();
            equalVerticeQuantity = true;
            if equalVerticeQuantity
                polygonDestVertices = polygonDest.getVertices();
                for k=1:polygonDestNVertices
                    polygonDestVertex = polygonDestVertices{k};
                    destSensorHasNoPointAsVertex = obj.isNotVertex(polygonDestVertex);
                    if destSensorHasNoPointAsVertex
                        samePolygon = false;
                        return;
                    end
                end
                samePolygon = true;
            else
                samePolygon = false;
            end
        end

        function notSamePolygon = ne(obj, polygonDest)
            notSamePolygon = ~(obj.eq(polygonDest));
        end

    end

    methods (Access = private)
        function sides = generateSides(obj, vertices)
            sides = cell(1, obj.nvertices);
            for k=1:obj.nvertices-1
                newSide = Segment(vertices{k}, vertices{k+1});
                sides{k} = newSide;
            end
            sides{k+1} = Segment(vertices{k+1}, vertices{1});
        end
    end
end