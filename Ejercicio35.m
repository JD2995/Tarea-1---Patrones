function Ejercicio35()
    %Primera imagen de panama con ruido
    panama = imread('panamaGauss1.png');
    corte1 = imcrop(panama,[0 0 240 240]);
    corte2 = imcrop(panama,[0 240 240 240]);
    corte3 = imcrop(panama,[240 0 240 240]);
    imwrite(corte1,'cortep11.png');
    imwrite(corte2,'cortep12.png');
    imwrite(corte3,'cortep13.png');
    figure();
    plot(Ejercicio34(corte1));
    title('Corte 1 - Panama');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    figure();
    plot(Ejercicio34(corte2));
    title('Corte 2 - Panama');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    figure();
    plot(Ejercicio34(corte3));
    title('Corte 3 - Panama');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    
    %Segunda imagen de panama con ruido
    panama = imread('panamaGauss2.png');
    corte1 = imcrop(panama,[0 0 240 240]);
    corte2 = imcrop(panama,[0 240 240 240]);
    corte3 = imcrop(panama,[240 0 240 240]);
    imwrite(corte1,'cortep21.png');
    imwrite(corte2,'cortep22.png');
    imwrite(corte3,'cortep23.png');
    figure();
    plot(Ejercicio34(corte1));
    title('Corte 1 - Panama');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    figure();
    plot(Ejercicio34(corte2));
    title('Corte 2 - Panama');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    figure();
    plot(Ejercicio34(corte3));
    title('Corte 3 - Panama');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    
    %Primera imagen de semilla con ruido
    panama = imread('semillasGauss1.png');
    corte1 = imcrop(panama,[0 0 240 240]);
    corte2 = imcrop(panama,[0 240 240 240]);
    corte3 = imcrop(panama,[240 0 240 240]);
    imwrite(corte1,'cortes11.png');
    imwrite(corte2,'cortes12.png');
    imwrite(corte3,'cortes13.png');
    figure();
    plot(Ejercicio34(corte1));
    title('Corte 1 - Semillas');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    figure();
    plot(Ejercicio34(corte2));
    title('Corte 2 - Semillas');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    figure();
    disp(sum(Ejercicio34(corte3)));
    plot(Ejercicio34(corte3));
    title('Corte 3 - Semillas');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    
    %Segunda imagen de semillas con ruido
    panama = imread('semillasGauss2.png');
    corte1 = imcrop(panama,[0 0 240 240]);
    corte2 = imcrop(panama,[20 20 240 240]);
    corte3 = imcrop(panama,[50 50 240 240]);
    imwrite(corte1,'cortes21.png');
    imwrite(corte2,'cortes22.png');
    imwrite(corte3,'cortes23.png');
    figure();
    plot(Ejercicio34(corte1));
    title('Corte 1 - Semillas');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    figure();
    plot(Ejercicio34(corte2));
    title('Corte 2 - Semillas');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
    figure();
    plot(Ejercicio34(corte3));
    title('Corte 3 - Semillas');
    xlabel('Valor de intensidad');
    ylabel('Ocurrencias');
end