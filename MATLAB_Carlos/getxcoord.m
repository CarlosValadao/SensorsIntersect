function [xcoord] = getxcoord(varargin)
    lengthVarargin = length(varargin);
    xcoord = 1:lengthVarargin;
    for k = 1:lengthVarargin
        point = varargin{k};
        xcoord(k) = point(1);
    end
end