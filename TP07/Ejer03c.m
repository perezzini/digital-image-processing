% Ejer03a.m: busca umbral como mínimo de una función dada
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

%% Calcula histograma y evalúa error para cada nivel de gris
h = imhist(I);

E = zeros(256, 1); % contiene error calculado para nivel de gris

for z = 0:255 % para cada z calcula E
    E(z + 1) = calerror(z, h);
end

[~, minE] = min(E); % busca posición del error mínimo

%% segmentación
umbral = minE - 1;
Ibn = im2bw(I, umbral/255);

%%
figure,imshowpair(I,Ibn,'montage')
title(sprintf('%s segmentada con umbral %d',NomImag,umbral))