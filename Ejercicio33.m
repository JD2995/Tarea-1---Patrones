function Ejercicio33()
    semillas = imread('semillas.png');
    panama = imread('example.jpg');
    semillas = rgb2gray(semillas);
    panama = rgb2gray(panama);
    %Ruido gaussiano con media 0 y varianza 0.01
    panamaGauss1 = imnoise(panama,'gaussian',0,0.01);
    semillasGauss1 = imnoise(semillas,'gaussian',0,0.01);
    %Ruido gaussiano con media 0.1 y varianza 0.01
    panamaGauss2 = imnoise(panama,'gaussian',0,0.005);
    semillasGauss2 = imnoise(semillas,'gaussian',0,0.005);
    %Almacenamiento de imagenes
    imwrite(panamaGauss1,'panamaGauss1.png');
    imwrite(panamaGauss2,'panamaGauss2.png');
    imwrite(semillasGauss1,'semillasGauss1.png');
    imwrite(semillasGauss2,'semillasGauss2.png');
end