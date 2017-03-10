function principalComponents()
    generatedPoints = generarPuntos(20);
    plotter();
    plotter3DPoints(generatedPoints);
    matCovarianza = cov(generatedPoints');
    [eVectors, eValues] = eigValVec(matCovarianza);
    gSpace = getEspacioGen(eVectors, eValues, 2);
    ortonormal = isOrtonormal(gSpace);
    medMatrix = mediaProbabilistica(generatedPoints);
    projection = projectionMatriz(medMatrix, gSpace);
    plotter3DPoints(projection);
    plotterVector(gSpace(:,1));
    plotterVector(gSpace(:,2));
    reductoMaxima = reductoDimensionMatrix(projection, gSpace);
    plotter2DPoints(reductoMaxima);
end

function resultado = reductoDimensionMatrix(MatrixProjection, MatrixAutoVectors)
    resultado = [];
    maxI = length(MatrixProjection(1,:));
    while 0 < maxI
        reductoVector = reductoDimensionVector(MatrixProjection(:,1), MatrixAutoVectors);
        resultado = [resultado reductoVector];
        MatrixProjection = MatrixProjection(:, 2:length(MatrixProjection(1,:)));
        maxI = maxI - 1;
    end
end

function resultado = reductoDimensionVector(Vector, MatrixAutoVectors)
    resultado = [];
    maxI = length(MatrixAutoVectors(1,:));
    i = 1;
    while i <= maxI
        reducto = dot(Vector,MatrixAutoVectors(:,i));
        resultado = [resultado; reducto];
        i = i + 1;
    end
end

function proy = projectionMatriz(MatrixProy, Matrix)
    proy = [];
    maxI = length(MatrixProy(1,:));
    while 0 < maxI
        proyVector = projectionVector(MatrixProy(:,1), Matrix);
        proy = [proy proyVector];
        MatrixProy = MatrixProy(:, 2:length(MatrixProy(1,:)));
        maxI = maxI - 1;
    end
end

function proy = projectionVector(vector, Matrix)
    coeficienteProy1 = Matrix*inv(Matrix'*Matrix)*Matrix';
    coeficienteProy2 = Matrix*Matrix';
    proy = coeficienteProy1 * vector;
    proySimp = coeficienteProy2 * vector;
end

function resultado = mediaProbabilistica(Matrix)
    med = median(Matrix(:));
    resultado = Matrix - med;
end

function resultado = isOrtonormal(Matrix)
    resultado = 1;
    maxI = length(Matrix(1,:));
    while 1 < maxI
        vectorOrtonormal = isVectorOrtonormal(Matrix(:,1), Matrix);
        resultado = resultado && vectorOrtonormal;
        Matrix = Matrix(:, 2:length(Matrix(1,:)));
        maxI = maxI - 1;
    end
end

function resultado = isVectorOrtonormal(Vector, Matrix)
    ortogonal = 1;
    normal = 1;
    for i = 1:(length(Matrix(1,:)))
        if(ne(Vector, Matrix(:,i)))
            ortogonal = ortogonal && (dot(Vector', Matrix(:,i)) == 0);
        end
    end
    normal = normal && (dot(Vector,Vector) == 1);
    resultado = ortogonal && normal;
end

function resultado = getEspacioGen(eigVector, eigValues, nBestVectors)
    generatedSpace = [];
    for i = 1:nBestVectors
        [~, IR] = max(eigValues);
        bigOne = eigVector(:, IR);
        eigVectorValuesFirst = eigValues(:, 1:IR-1);
        eigVectorValuesSecond = eigValues(:, IR+1:length(eigValues));
        eigValues = [eigVectorValuesFirst eigVectorValuesSecond];
        generatedSpace = horzcat(generatedSpace, bigOne);
    end
    resultado = generatedSpace;
end

function [eigVectors, eigValues ] = eigValVec(MatCov)
    [eigVectors, eigValues] = eig(MatCov);
    eigValues = sum(eigValues);
end

function resultado = generarPuntos(n)
    E = rand([2 n]);
    X = E(1,:);
    Y = E(2,:);
    z = ecuacionPlano(X,Y);
    resultado = [E;z];
end

function Z = ecuacionPlano(X, Y)
    Z = 0.2.*X + Y + normrnd(0,0.05);
end

function plotter()
    x = -0.8:.001:1.2;
    [X, Y] = meshgrid(x);
    z = ecuacionPlano(X, Y);
    z1 = z.*0;
    figure; 
    surf(X, Y, z);
    shading flat;
    xlabel('x');
    ylabel('y');
    zlabel('z');
    hold on;
    surf(X, Y, z1);
end

function plotter3DPoints(vectors)
    hold on;
    scatter3(vectors(1,:),vectors(2,:),vectors(3,:));
end

function plotter2DPoints(vectors)
    hold on;
    scatter(vectors(1,:),vectors(2,:));
end

function plotterVector(vector)
    hold on;
    quiver3(0,0,0,vector(1), vector(2), vector(3));
end

