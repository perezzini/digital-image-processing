% Ejer01.m: dilataci�n de im�genes (consideramos que el objeto a dilatar siempre 
% est� en blanco. Se considera que el fondo siempre es negro)
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);
%%
% se = eye(5);
% se = ones(5);
% se = [1 0 0 0 1; 0 1 0 1 0; 0 0 1 0 0; 0 1 0 1 0; 1 0 0 0 1];
% se = [0 0 1 0 0; 0 0 1 0 0; 1 1 1 1 1; 0 0 1 0 0; 0 0 1 0 0];
se = strel('disk', 2);

Id = imdilate(I, se);
%%
figure,imshowpair(I, Id, 'montage')
title(sprintf('%s dilatada', NomImag))