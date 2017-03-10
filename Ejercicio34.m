function Hist = Ejercicio34(imagen)
    Hist = calcularHist(imagen);
end

function Hist = calcularHist(imagen)
    tamano = size(imagen);
    filas = tamano(1);
    columnas = tamano(2);
    Hist = zeros(1,256);
    for i=1:filas
        for j=1:columnas
            Hist((imagen(i,j)+1))= Hist((imagen(i,j) + 1)) + 1;
        end
    end
    Hist = Hist./(filas*columnas);
            
end