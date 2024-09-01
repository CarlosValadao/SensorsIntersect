% realiza o plot de um sensor com base nos seus
% niveis de FoV, l1, l2 e l3.
% Talvez tornar a assinatura dessa funcao
% em relacao aos parametros, parecida com a funcao
% plotSensors
% sensors e um array que contem todos os sensores
% a serem plotados
function plotSensorsFromFoV(sensors)
    for sensor=sensors
        plotSensorFromFoV(sensor);
    end
end