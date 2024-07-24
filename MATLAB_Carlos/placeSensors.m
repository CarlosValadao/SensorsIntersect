%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     SENSOR'S CONFIGURATION    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Depende de nSensors, nVisualSensors, theta e R

vSensors = cell(0);
pos = zeros(nSensors,2);
for i=1:nSensors,
    if(i>=1 && i<=nVisualSensors),
        disp([num2str(i) '. Set PLACE and ORIENTATION of visual node['...
                                                        num2str(i) '].']);

        %for position
        [ax, ay] = ginput(1);
        pos(i+1,:) = [ax, ay];
        plot(ax, ay, 'o', 'MarkerSize',10,...
                          'MarkerEdgeColor','red',...
                          'MarkerFaceColor','red');

        %for orientation
        [bx, by] = ginput(1);

        %alfa = atan()
        xx = (bx-ax);
        yy = (by-ay);
        test = (yy)/(xx);
        if((xx)>0 && (yy)>0),
            alfa = atan(test);
        elseif((xx)<0),
            alfa = atan(test)+pi;
        elseif((xx)>0 && (yy)<0),
            alfa = atan(test)+2*pi;
        elseif((xx)==0 && (yy)>0),
            alfa = pi/2;
        elseif((xx)==0 && (yy)<0),
            alfa = 3*pi/2;
        elseif((xx)>=0 && (yy)==0),
            alfa = 0;
        elseif((xx)<0 && (yy)==0),
            alfa = pi;
        end
        alfa = alfa-theta/2;

        %alfa = atan((by-ay)/(bx-ax))-theta/2
        auxVSensor.alfa = alfa;

        auxVSensor.Ax = ax;
        auxVSensor.Ay = ay;

        auxVSensor.Bx = auxVSensor.Ax + R*cos(auxVSensor.alfa);
        auxVSensor.By = auxVSensor.Ay + R*sin(auxVSensor.alfa);

        auxVSensor.Cx = auxVSensor.Ax + R*cos(mod(auxVSensor.alfa+theta, 2*pi));
        auxVSensor.Cy = auxVSensor.Ay + R*sin(mod(auxVSensor.alfa+theta, 2*pi));

        plotSensors({auxVSensor},0);
        plot(ax, ay, 'o', 'MarkerSize',10,...
                          'MarkerEdgeColor','red',...
                          'MarkerFaceColor','red');

        vSensors{i} = auxVSensor;
    elseif(i>nVisualSensors && i<nSensors),
        disp([num2str(i) '. Set PLACE scalar node[' num2str(i-nVisualSensors) '].']);

        %for position
        [ax ay] = ginput(1);
        pos(i+1,:) = [ax, ay];

        plot(ax, ay, 'd', 'MarkerSize',10,...
                          'MarkerEdgeColor','blue',...
                          'MarkerFaceColor','blue');
    elseif(i==nSensors),
        disp([num2str(i) '. Set PLACE of sink node.']);

        %for position
        [ax ay] = ginput(1);
        pos(1,:) = [ax, ay]; %Index 1 is reserved for node 0 (SINK)

        plot(ax, ay, 's', 'MarkerSize',10,...
                          'MarkerEdgeColor','black',...
                          'MarkerFaceColor','black');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%