% Ejer02.m: erosión de imágenes (consideramos que el objeto a dilatar siempre 
% está en blano. Se considera que el fondo siempre es negro)
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);
%%
% se = eye(15);
se = ones(15);
% se = [1 0 0 0 1; 0 1 0 1 0; 0 0 1 0 0; 0 1 0 1 0; 1 0 0 0 1];
% se = [0 0 1 0 0; 0 0 1 0 0; 1 1 1 1 1; 0 0 1 0 0; 0 0 1 0 0];
% se = strel('disk', 2);

Id = imerode(I, se);
%%
figure,imshowpair(I, Id, 'montage')
title(sprintf('%s erosionada', NomImag))