% Ejer04.m: closing de im�genes (consideramos que el objeto siempre 
% est� en blano. Se considera que el fondo siempre es negro)

% El closing, por ejemplo, sirve para rellenar objetos con agujeros.
% C�lculo: dilataci�n -> erosi�n

clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);
%%
% se = eye(15);
% se = ones(15);
% se = [1 0 0 0 1; 0 1 0 1 0; 0 0 1 0 0; 0 1 0 1 0; 1 0 0 0 1];
% se = [0 0 1 0 0; 0 0 1 0 0; 1 1 1 1 1; 0 0 1 0 0; 0 0 1 0 0];
se = strel('disk', 2);

Id = imclose(I, se);
%%
figure,imshowpair(I, Id, 'montage')
title(sprintf('%s close', NomImag))