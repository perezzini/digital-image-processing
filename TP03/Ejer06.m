% Ejer06.m: filtros no linealesclear all
clear all
%close all

Resp=input('Nombre imagen: ','s');  
if isempty(Resp)
    return
end
I=imread(Resp);

Resp=input('Tamaño kernel [3]: ','s');
if isempty(Resp)
    Resp='3';
end
Tk=eval(Resp);

%% Filtro de mediana (filtro pasa bajos; no utiliza la función de convolución)
M = medfilt2(I, [Tk Tk]); % medfilt2() analiza los bordes de la imagen. 
                          % Probablemente, colocando 0's. Por esto, en las esquinas de las imagenes hay un pixel negro

figure, imshow([I M]), title((sprintf('Mediana kernel %dx%d',Tk,Tk)))
% Luego, se le podría aplicar un filtro PA para realzar los bordes en caso
% de que la imagen quede muy borroneado

%% Filtro Alfa Recortado (filtro PB)
Resp=input('Parámtro del filtro alfaR: ','s');
if isempty(Resp)
    return;
end
pAlfa = eval(Resp);

AR = im2uint8(mat2gray(alfaRecortado(I, [Tk Tk], pAlfa)));

figure, imshow([I AR])
title((sprintf('Alfa Recortado: kernel %dx%d, pAlfa = %d', Tk, Tk, pAlfa)))

%% Filtro Adaptativo
Resp=input('Desvío del ruido: ','s');
if isempty(Resp)
    return;
end
sR = eval(Resp);

ECM = im2uint8(mat2gray(fECM(I, [Tk Tk], sR)));

figure, imshow([I ECM])
title((sprintf('Filtro Adaptativo: kernel %dx%d, sRuido = %.2f', Tk, Tk, sR)))

% Para calcular el desvío std. de la imagen a ingresar hacemos:
% I = imtool(I);
% std2(I(1:30, :))