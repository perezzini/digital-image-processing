% Ejer01.m: detecci�n de puntos aislados, l�neas y bordes
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

%% Detecci�n de puntos aislados
pa=[-1 -1 -1;-1 8 -1;-1 -1 -1];
PA=imfilter(I,pa);

Resp = input('Ingrese umbral [0, 255]: ', 's');
if isempty(Resp)
    Resp = '127';
end

umbral = eval(Resp);

PAbw = im2bw(PA, umbral/255); % level tiene que estar entre 0 y 1

figure, imshowpair(I, PAbw, 'montage')
title(sprintf('Detecci�n de puntos aislados con umbral = %d', umbral))

%% Detecci�n de l�neas
hor = [-1 -1 -1; 2 2 2; -1 -1 -1];
ver = hor';
p45 = [-1 -1 2; -1 2 -1; 2 -1 -1];
n45 = [2 -1 -1; -1 2 -1; -1 -1 2];

HOR = imfilter(I, hor);
VER = imfilter(I, ver);
P45 = imfilter(I, p45);
N45 = imfilter(I, n45);

figure, imshow([HOR VER; P45 N45])  

% M1 = HOR > VER;

Lineas=imlincomb(0.25,HOR,0.25,VER,0.25,P45,0.25,N45);
figure,imshowpair(I,Lineas,'montage')
title('Detecci�n de l�neas')

Resp = input('Ingrese umbral [0, 255]: ', 's');
if isempty(Resp)
    Resp = '127';
end

umbral = eval(Resp);

Lineasbw = im2bw(Lineas, umbral/255); % level tiene que estar entre 0 y 1

figure, imshowpair(I, Lineasbw, 'montage')
title(sprintf('Detecci�n de l�neas con umbral = %d', umbral))