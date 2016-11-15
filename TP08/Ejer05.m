% Ejer05.m: determinación de perímetros
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);
%% 
Ip4 = bwperim(I, 4); % b (A) = A?[A(?)B]
Ip8 = bwperim(I, 8);

%%
figure,imshowpair(I, Ip4, 'montage')
title(sprintf('Perímetro de %s con 4 vecinos', NomImag))

figure,imshowpair(I, Ip8, 'montage')
title(sprintf('Perímetro de %s con 8 vecinos', NomImag))