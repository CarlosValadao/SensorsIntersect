function planarPolygon = polyshape2PlanarPolygon(polyshapePolygon)
    polyshapePolygonVertices = polyshapePolygon.Vertices;
    sizePolyshapeUnionVertices = size(polyshapePolygonVertices, 1);
    polyshapePolygonPoints = mat2cell(polyshapePolygonVertices, ...
                             ones(sizePolyshapeUnionVertices, 1), 2);
    planarPolygon = PlanarPolygon(polyshapePolygonPoints{:});
end