% Close all the open figures if they're open
function closeAllFigures()
    figures = findobj('Type', 'figure');
    if isempty(figures)
        return;
    else
        close(figures);
    end
end
