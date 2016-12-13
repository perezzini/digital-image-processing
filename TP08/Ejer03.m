% Ejer03.m: opening de im�genes (consideramos que el objeto siempre 
% est� en blanco. Se considera que el fondo siempre es negro)

% El opening, por ejemplo, sirve para separar objetos de diferentes
% tama�os.
% C�lculo: erosi�n -> dilataci�n

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

Id = imopen(I, se);
%%
figure,imshowpair(I, Id, 'montage')
title(sprintf('%s opened', NomImag))