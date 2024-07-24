function [ycoord] = getycoord(varargin)
    lengthVarargin = length(varargin);
    ycoord = 1:lengthVarargin;
    for k = 1:lengthVarargin
        point = varargin{k};
        ycoord(k) = point(2);
    end
end 