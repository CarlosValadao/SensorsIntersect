% Esta funcao retorna a intersecao entre dois segmentos paralelos e contidos
% de tal forma se segmentDest estiver contido em segmentOrigin, os pontos
% de intersecao sao os que delimitam segmentDest, analogamente para quando segmentOrigin
% estiver contido em segmentDest

function [hasIntersection, xi, yi] = getParallelSegmentsIntersection(segmentOrigin, segmentDest)
    startPointSegmentOrigin = segmentOrigin.getStartPoint();
    endPointSegmentOrigin = segmentOrigin.getEndPoint();
    startPointSegmentDest = segmentDest.getStartPoint();
    endPointSegmentDest = segmentDest.getEndPoint();
    if isyconstfunc()
end