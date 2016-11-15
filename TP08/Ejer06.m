% Ejer06.m: determinación de esqueletos
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);
%%
Ie = bwmorph(I, 'skel', Inf);
Ie4 = bwmorph(I, 'skel', 4);
Ie10 = bwmorph(I, 'skel', 10);

%%
figure,imshow([I Ie; Ie4 Ie10])
title(sprintf('Determinación de esqueletos de %s', NomImag))