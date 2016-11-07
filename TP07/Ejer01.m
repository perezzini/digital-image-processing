% Ejer01.m: detección de puntos aislados, líneas y bordes
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

%% Detección de puntos aislados
pa=[-1 -1 -1;-1 8 -1;-1 -1 -1];
PA=imfilter(I,pa);

Resp = input('Ingrese umbral [0, 255]: ', 's');
if isempty(Resp)
    Resp = '127';
end

umbral = eval(Resp);

PAbw = im2bw(PA, umbral/255); % level tiene que estar entre 0 y 1

figure, imshowpair(I, PAbw, 'montage')
title(sprintf('Detección de puntos aislados con umbral = %d', umbral))

%% Detección de líneas
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
title('Detección de líneas (comb. lineal)')

Resp = input('Ingrese umbral [0, 255]: ', 's');
if isempty(Resp)
    Resp = '127';
end

umbral = eval(Resp);

Lineasbw = im2bw(Lineas, umbral/255); % level tiene que estar entre 0 y 1

figure, imshowpair(I, Lineasbw, 'montage')
title(sprintf('Detección de líneas con umbral = %d', umbral))

%% Derivadas
dx = [0 -1; 0 1];
dy = [0 0; -1 1];

DX = imfilter(I, dx);
DY = imfilter(I, dy);

figure, imshowpair(DX, DY, 'montage')
title('Derivada horizontal y vertical')

%% Gradientes

% Roberts
[Rmag, Rdir] = imgradient(I, 'Roberts');
Rx = Rmag.*cos(Rdir); % calcula gradiente horizontal
Ry = Rmag.*sin(Rdir); % calcula gradiente vertical
figure, subplot(211) % "2 filas / 1 col"
imshowpair(abs(Rx), abs(Ry), 'montage')
title('Gradientes Roberts Rx y Ry')
subplot(212)
imshowpair(I, Rmag, 'montage')
title('Imagen original y módulo del gradiente Roberts')

% Prewitt
[Px, Py] = imgradientxy(I, 'Prewitt');
figure, subplot(211) % "2 filas / 1 col"
imshowpair(abs(Px), abs(Py), 'montage')
title('Gradientes Prewitt Px y Py')
subplot(212)
imshowpair(I, sqrt(Px.^2 + Py.^2), 'montage')
title('Imagen original y módulo del gradiente Prewitt')

% Sobel
k = fspecial('average', 5);
Ipb = imfilter(I, k); % aplico filtro PB para eliminar algo de ruido (filtro promedio de 5 por 5)

[Sx, Sy] = imgradientxy(Ipb, 'Sobel');
figure, subplot(211) % "2 filas / 1 col"
imshowpair(abs(Sx), abs(Sy), 'montage')
title('Gradiente Sobel Sx y Sy')
subplot(212)
imshowpair(I, sqrt(Sx.^2 + Sy.^2), 'montage')
title('Imagen original y módulo del gradiente Sobel')

% Laplaciano
Resp = input('Parámetro de Laplaciano: ', 's');
if isempty(Resp)
    Resp = '0';
end
forma = eval(Resp);
k1 = fspecial('laplacian', forma);
Ilap = imfilter(I, k1);

figure,imshowpair(I, Ilap, 'montage');
title('Imagen original e imagen filtrada por Laplaciano')

% LoG
klog = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0];

Ipb = imfilter(I, k); % aplico filtro PB para eliminar algo de ruido (filtro promedio de 5 por 5)

Ilog = imfilter(Ipb, klog);
figure,imshowpair(I, Ilog, 'montage');
title('Imagen original e imagen filtrada por Laplaciano de Gaussian LoG')

%% edge()
BordeS = edge(I, 'sobel');
BordeLoG = edge(I, 'log');

figure, imshowpair(BordeS, BordeLoG, 'montage')
title('Bordes calculados con Sobel y LoG')