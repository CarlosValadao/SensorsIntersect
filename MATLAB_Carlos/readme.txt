    15 de marco de 2024 - 11:54

A funcao eq em PlanarPoligono compara se todos os vertices sao iguais
se sim, o poligono e o mesmo, isto e, igual, mas todos sabemos que na matematica
a semelhanca de triangulos nao e computada desta forma. A explicacao para o comportamento
desta funcao e que no contexto do problema, todos os sensores seriam semelhantes, de acordo com a
matematica, e como a posicao dos sensores e muito relevante para o programa, de tal forma que a posicao
de cada poligono pode identifica-lo de forma unica, logo esse foi o criterio para determinar se um poligono
e igual ao outro ou nao (a posicao dos pontos que compoem o poligono, ou vertices)

Obviamente, para que a semelhanca de poligonos possa ser feita, e necessario que eles possuam pelo menos
a mesma quantidade de vertices, segmentos...


20 de março de 2024

Para descobrir os sensores que estao parcialmente contidos na area de interesse, eu
vou fazer por eliminacao - logo - estes sao a diferenca entre os sensores que estao
totalmente fora e os que estao totalmente contidos, pois os sensores podem estar
ou totalmente contidos, os totalmente fora, ou parcialmente contido/parcialmente fora,
da area de interesse

As intersecoes que devem levar em consideracao os pontos "de dentro"
sao aquelas que se dao entre a area de interesse e os sensores que estao
parcialmente fora dela, cabendo ao algoritmo determinar o poligono que contem
exatamente a mesma area em comum entre os dois poligonos, a area de interesse, um
retangulo, e um triangulo isosceles, o sensor.


23 de março de 2024

A funcao interPolygon que usa a funcao getFullPlanarPolygonIntersection
funciona de forma adequada quando os poligonos nao possuem nenhum lado contido
no outro, ou seja, um lado encima do outro, por assim dizer, de resto funciona de forma
adequada, talvez seja necessario fazer com que funcione independente da posicao do sensor
em relacao a area de interesse. De resto tudo esta funcionando perfeitamente


24 de março de 2024

update sensor polygon  partially contained


25 de março de 2024

Devido ao pre-processamento feito utilizando a funcao interpolygon, para
determinar os novos poligonos dos poligonos parcialmente contidos na area
de interesse, todos os sensores que se intersectam com qualquer lado da
area de interesse tera um lado paralelo a este correspondente lado, melhor
dizendo, um lado contido na area de interesse, de tal forma que quando for
computado esta interseçao, os pontos serao os mesmos pontos que determinam
aquele lado paralelo ao lado da area de monitoramento

Logo a funcao que ira trabalhar com os lados direitos e esquerdos da area de interesse
apenas buscarao um segmento que e uma funcao constante em y, yconstfunc.
Ela sera apelidada de sideMonitoringAreaIntersection e sera responsavel por fazer
isto que acabei de descrever nestes dois paragrafos

sideMonitoringAreaIntersection


27 de março de 2024

O calculo de intersecao se dara entre os sensores e entre os
sensores e a area de monitoramento, dessa forma, toda e qualquer
interseçao sera computada. Uma vez que apos o pre-processamento
a intersecao entre um sensor e a area de monitoramento se dara
por pontos, no maximo dois pontos, uma vez que os segmentos dos
sensores estarao paralelos aos segmentos da area de monitoramento,
no plural ou no singular.

30 de março de 2024

Uma vez que um sensor intersecta em no máximo e apenas dois pontos na area
de interesse, logo a funcao que realiza a intersecao entre um lado da area
de interesse e um sensor retornara, para cada sensor, um array contendo
dois pontos.

07 de maio de 2024

Se ocorrer de dois sensores forem gerados a partir de um mesmo
ponto, o código gerará um erro ao calcular o convex de Hull


05/06/2024

Eu preciso mapear quais arquivos estão sendo usados e quais podem ser excluídos, para que
eu consiga despoluir um pouco os arquivos guardados aqui nesta pasta, porque eles são muitos
e estão me atrapalhando e mais, incomodando


+ isContainedInY.m                              
..                                            + isSensorContainedInMonitoringArea.m           
MonitoringArea.m                              isSensorOutOfMonitoringArea.m                 
+ PlanarPolygon.m                             + isSensorTotallyOutMonitoringArea.m            
+ Segment.m                                     isxconstfunc.m                                
+ Sensor.m                                      + isyconstfunc.m                                
+ calcVerticesMonitoringArea.m                  joinXYCoordinates.m                           
- calculateBarycenter.m                         main.m                                        
+ clearConsole.m                                . main2.m                                       
+ closeOpenFigures.m                            - main3.m                                       
conv_hull_output_and_ordernando_array.txt     - main4.m                                       
createArrayNodeLabels.m                       - main5.m                                       
+ fillCellVectorWithSelection.m                 - main6.m                                       
+ findContainedVertices.m                       - main7.m                                       
+ findMonitoringAreaSideIntersections.m         - main8.m                                       
- functest.m                                    - main9.m                                       
+ generateMonitoringArea.m                      placeSensors.m                                
+ getFullPlanarPolygonIntersection.m            + plotMonitoringArea.m                          
+ getLineEquationd.m                            + plotPlanarPolygon.m                           
getMALineEquations.m                          + plotSensor.m                                  
getMonitoringAreaIntersectionPoints.m         + plotSensors.m                                 
getMonitoringAreaPoints.m                     pointInSegment.m                              
getParallelSegmentsIntersection.m             + randomNSensors.m                              
getPlanarPolygonIntersection.m                readme.txt                                    
- getSegmentsIntersection copy.m                removeSensorsContainedMonitoringArea.m        
+ getSegmentsIntersection.m                     removeSensorsOutMonitoringArea.m              
getSegmentsIntersectionLE.m                   removeSensorsOutsideMonitoringArea.m          
+ getSensorsInMonitoringArea.m                  segmentInterPolygon.m                         
+ getSensorsIntersection.m                      setPointsInside.m                             
+ getSensorsOutMonitoringArea.m                 sideMonitoringAreaIntersection.m              
+ getSensorsPartiallyContainedMonitoringArea.m  sidePolygonContainsSegment.m                  
- getSubsegmentInsideMonitoringArea.m           - solve3unknowns.m                              
getxcoord.m                                   + sortPoints.m                                  
getycoord.m                                   + sortSensorsByDist.m                           
images                                        + splitXYCoordinates.m                          
+ interPolygon.m                                updateSegmentPointsInsideMonitoringArea.m     
+ intersectSegmentWithSensor.m                  + updateSensorPolygonPartiallyContained.m       
+ inverseLinearFunction.m                       


Os arquivos que deverao ser excuídos serão marcados com o sinal de menos (-) como sufixo,
enquanto os já apagados serão marcados com OK como sufixo. Já os arquivos que serão setados
no .gitignore estarão com "." como prefixo
Os arquivos que devem ser mantidos receberão um mais (+) como prefixo