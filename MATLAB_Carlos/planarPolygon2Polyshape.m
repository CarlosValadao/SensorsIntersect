% Converte um polígono planar para um polyshape
function planarShape = planarPolygon2Polyshape(planarPolygon)
    xCoordPlanarPolygon = planarPolygon.getXPointCoords;
    yCoordPlanarPolygon = planarPolygon.getYPointCoords;
    planarShape = polyshape(xCoordPlanarPolygon, yCoordPlanarPolygon);
end