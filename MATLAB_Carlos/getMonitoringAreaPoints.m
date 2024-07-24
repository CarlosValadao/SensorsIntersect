% Recebe a largura, a altura e o angulo de deslocamento e
% as coordenadas e e y da area de interesse, (theta) e retorna dois vetores
% o primeiro contem as coorndenadas x dos pontos e o segundo
% contendo as coordenadas y dos pontos, ambos os vetores de
% tamanho 4.
% xorigins, yorigins, width, height, beta <= argumentos dessa funcao
function [xcoords, ycoords] = getMonitoringAreaPoints(varargin)
    xcoords = zeros(1, 4);
    ycoords = zeros(1, 4);
    if nargin == 3
        xorigins = 0;
        yorigins = 0;
    else
        [xorigins, yorigins, width, height, beta] = varargin{:};
    end
    xcoords(1) = xorigins;
    ycoords(1) = yorigins;
    xcoords(2) = xorigins + width*cos(beta);
    ycoords(2) = yorigins + width*sin(beta);
    xcoords(3) = xorigins + (height*sin(beta)) + (width*cos(beta));
    ycoords(3) = yorigins - (height*cos(beta)) + (width*sin(beta));
    ycoords(4) = yorigins - height*cos(beta);
    xcoords(4) = xorigins + height*sin(beta);