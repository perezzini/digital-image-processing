% Ejer01.m: detecci�n de puntos aislados, l�neas y bordes
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

%% Detecci�n de puntos aislados (usa m�scara laplaciana: detecta l�neas verticales, horizontales, n45 y p45)
pa=[-1 -1 -1;-1 8 -1;-1 -1 -1]; % Laplacian mask. Se formula mediante las derivadas segundas
PA=imfilter(I,pa);

Resp = input('Ingrese umbral [0, 255]: ', 's');
if isempty(Resp)
    Resp = '127';
end

umbral = eval(Resp);

% image thresholding
PAbw = im2bw(PA, umbral/255); % level tiene que estar entre 0 y 1

figure, imshowpair(I, PAbw, 'montage')
title(sprintf('(Thresholding) Detecci�n de puntos aislados (usando Laplacian mask) con umbral = %d', umbral))

%% Detecci�n de l�neas horizontales y verticales

% kernels (todos suman 0 para que de �ste resultado en superficies uniformes)
hor = [-1 -1 -1; 2 2 2; -1 -1 -1];
ver = hor';
p45 = [-1 -1 2; -1 2 -1; 2 -1 -1];
n45 = [2 -1 -1; -1 2 -1; -1 -1 2];

HOR = imfilter(I, hor);
VER = imfilter(I, ver);
P45 = imfilter(I, p45);
N45 = imfilter(I, n45);

figure, imshow([HOR VER; P45 N45])
title('Detecci�n de lineas horizontales, verticales; p45, n45')

% M1 = HOR > VER;

Lineas=imlincomb(0.25,HOR,0.25,VER,0.25,P45,0.25,N45); % detectan todas las l�neas: verticales, horizontales, n45 y p45
figure,imshowpair(I,Lineas,'montage')
title('Detecci�n de l�neas (comb. lineal)')

Resp = input('Ingrese umbral [0, 255]: ', 's');
if isempty(Resp)
    Resp = '127';
end

umbral = eval(Resp);

Lineasbw = im2bw(Lineas, umbral/255); % level tiene que estar entre 0 y 1

% image thresholding de la comb. lineal anterior
figure, imshowpair(I, Lineasbw, 'montage')
title(sprintf('Thresholding de la comb. lineal de detecci�n de l�neas verticales, horizontales, p45 y n45 (con umbral = %d)', umbral))

%% Derivadas horizontales y verticales (derivadas de primer orden)
dx = [0 -1; 0 1]; % derivada horizontal
dy = [0 0; -1 1]; % derivada vertical

DX = imfilter(I, dx);
DY = imfilter(I, dy);

figure, imshowpair(DX, DY, 'montage')
title('Derivada horizontal y vertical (derivadas de primer orden)')

%% Gradientes (derivadas parciales - de primer orden)

% grad(f) = [df/dx; df/dy]

% Roberts (m�scara de 2x2 - las m�scaras de 2x2 no resultan tan suficientes como las de 3x3)
[Rmag, Rdir] = imgradient(I, 'Roberts');
Rx = Rmag.*cos(Rdir); % calcula gradiente horizontal
Ry = Rmag.*sin(Rdir); % calcula gradiente vertical
figure, subplot(211) % "2 filas / 1 col"
imshowpair(abs(Rx), abs(Ry), 'montage')
title('Gradientes Roberts Rx (l�neas horizontales) y Ry (l�neas verticales)')
subplot(212)
imshowpair(I, Rmag, 'montage')
title('Imagen original y m�dulo del gradiente Roberts')

% Prewitt (m�scara de 3x3)
[Px, Py] = imgradientxy(I, 'Prewitt');
figure, subplot(211) % "2 filas / 1 col"
imshowpair(abs(Px), abs(Py), 'montage')
title('Gradientes Prewitt Px (l�neas horizontales) y Py (l�neas verticales)')
subplot(212)
imshowpair(I, sqrt(Px.^2 + Py.^2), 'montage')
title('Imagen original y m�dulo del gradiente Prewitt')

% Sobel (m�scara de 3x3. Mejor smoothing que Prewitt)
k = fspecial('average', 5);
Ipb = imfilter(I, k); % aplico filtro PB para eliminar algo de ruido (filtro promedio de 5 por 5)

[Sx, Sy] = imgradientxy(Ipb, 'Sobel');
figure, subplot(211) % "2 filas / 1 col"
imshowpair(abs(Sx), abs(Sy), 'montage')
title('Gradiente Sobel Sx (l�neas horizontales) y Sy (l�neas verticales)')
subplot(212)
imshowpair(I, sqrt(Sx.^2 + Sy.^2), 'montage')
title('Imagen original y m�dulo del gradiente Sobel')

% Laplaciano
Resp = input('Par�metro de Laplaciano: ', 's');
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

%% edge(). Esta funci�n realiza, tambi�n, thresholding.
BordeS = edge(I, 'sobel');
BordeLoG = edge(I, 'log');

figure, imshowpair(BordeS, BordeLoG, 'montage')
title('Bordes calculados con Sobel y LoG')