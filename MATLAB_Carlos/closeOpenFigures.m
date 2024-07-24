% Close all the open figures if they're open
function closeOpenFigures()
    figures = findobj('Type', 'figure');
    if isempty(figures)
        return;
    else
        close(figures);
    end
end
