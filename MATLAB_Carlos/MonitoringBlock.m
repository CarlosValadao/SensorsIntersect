classdef MonitoringBlock < PlanarPolygon
    properties
        xVertices
        yVertices
        monitoringBlockPolyshape
        xBaricenter
        yBaricenter
        isCovered logical = false;
        % 4 simboliza nao cobertura, pois
        % 4 e maior que qualquer outro inteiro
        % que representa a qualidade de uma cobertura
        maxCoverageQuality uint8 = 4;
        coverages = [];
        % Os valores contidos aqui podem ser um
        % vetor coluna, pois o indice do sensor
        % pode ser dois numeros, ou mais caso ele
        % esteja contido em uma matriz bidimensional
        % ou n-dimensional
        coverageSensorsIdx = [];
    end

    methods
        function obj = MonitoringBlock(p1s, p2s, p3s, p4s, xc, yc)
            obj@PlanarPolygon(p1s, p2s, p3s, p4s);
            obj.xVertices = [ p1s(1) p2s(1) p3s(1) p4s(1) ];
            obj.yVertices = [ p1s(2) p2s(2) p3s(2) p4s(2) ];
            obj.monitoringBlockPolyshape = polyshape(obj.xvertices, obj.yVertices);
            obj.xBaricenter = xc;
            obj.yBaricenter = yc;
        end

        function addCoverage(obj, sensorIndex, coverageQuality)
            obj.coverageSensorsIdx = [ obj.coverageSensorsIdx sensorIndex ];
            obj.coverages = [ obj.coverages coverageQuality ];
            if obj.maxCoverageQuality > coverageQuality
                obj.maxCoverageQuality = coverageQuality;
            end
            if ~obj.isCovered
                obj.isCovered = true;
            end
        end
    end
end