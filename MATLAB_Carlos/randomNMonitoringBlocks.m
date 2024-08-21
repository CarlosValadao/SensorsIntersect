% Essa funcao gera n blocos de monitoramento
% monitoringBlocks com largura e altura especificadas
% e guarda na forma de matriz nxm
% onde = n = monitoringAreaHeigth/monitoringBlockHeight
%        m = monitoringAreaWidth/monitoringBlockWidth
function monitoringBlocks = randomNMonitoringBlocks(monitoringAreaXOrigin, monitoringAreaYOiring, ...
                            monitoringAreaWidth, monitoringAreaHeight, monitoringAreaBeta, ...
                            monitoringBlockWidth, monitoringBlockHeight)
    x1 = monitoringAreaXOrigin;
    y1 = monitoringAreaYOiring;
    M = floor(monitoringAreaWidth/monitoringBlockWidth);
    N = floor(monitoringAreaHeight/monitoringBlockHeight);
    ws = monitoringAreaWidth;
    hs = monitoringAreaHeight;
    beta = monitoringAreaBeta;
    m = 1;
    n = 1;
    x1s = x1 + ((m-1)*(ws/M)*cos(beta)) + ((n-1)*(hs/N)*sin(beta));
    y1s = y1 + ((m-1)*(ws/M)*sin(beta)) - ((n-1)*(hs/N)*cos(beta));
    x2s = x1 + (m*(ws/M)*cos(beta)) + ((n-1)*(hs/N)*sin(beta));
    y2s = y1 + (m*(ws/M)*sin(beta)) - ((n-1)*(hs/N)*cos(beta));
    x3s = x1 + ((m-1)*(ws/M)*cos(beta)) + (n*(hs/N)*sin(beta));
    y3s = y1 + ((m-1)*(ws/M)*sin(beta)) - (n*(hs/N)*cos(beta));
    x4s = x1 + (m*(ws/M)*cos(beta)) + ((n*(hs/N)*sin(beta)));
    y4s = y1 + (m*(ws/M)*sin(beta)) - (n*(hs/N)*cos(monitoringAreaBeta));
    xc = x1s + (x4s-x1s)/2;
    yc = y1s + (y4s-y1s)/2;
    monitoringBlock = MonitoringBlock([x1s y1s], [x2s y2s], [x4s y4s], [x3s y3s], xc, yc);
    monitoringBlocks = repmat(monitoringBlock, N, M);
    for m = 1:M
        for n = 1:N
            x1s = x1 + ((m-1)*(ws/M)*cos(beta)) + ((n-1)*(hs/N)*sin(beta));
            y1s = y1 + ((m-1)*(ws/M)*sin(beta)) - ((n-1)*(hs/N)*cos(beta));
            x2s = x1 + (m*(ws/M)*cos(beta)) + ((n-1)*(hs/N)*sin(beta));
            y2s = y1 + (m*(ws/M)*sin(beta)) - ((n-1)*(hs/N)*cos(beta));
            x3s = x1 + ((m-1)*(ws/M)*cos(beta)) + (n*(hs/N)*sin(beta));
            y3s = y1 + ((m-1)*(ws/M)*sin(beta)) - (n*(hs/N)*cos(beta));
            x4s = x1 + (m*(ws/M)*cos(beta)) + ((n*(hs/N)*sin(beta)));
            y4s = y1 + (m*(ws/M)*sin(beta)) - (n*(hs/N)*cos(monitoringAreaBeta));
            xc = x1s + (x4s-x1s)/2;
            yc = y1s + (y4s-y1s)/2;
            monitoringBlock = MonitoringBlock([x1s y1s], [x2s y2s], [x4s y4s], [x3s y3s], xc, yc);
            monitoringBlocks(n, m) = monitoringBlock;
        end
    end
end