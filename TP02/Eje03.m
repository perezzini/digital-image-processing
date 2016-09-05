% Eje03
% Inicialización
clear all
close all

Resp = input('Nombre imagen: ', 's');

if isempty(Resp)
   return
end

I = imread(Resp);

%%
% INVERSA
L = 255:-1:0;
Jinv = aplicaLUT(I, L);

% LOGARITMICA
% L = uint8(log((0:255)+1)/log(256)*255);
% Jlog = aplicaLUT(I, L);
%%
figure, subplot(121), imshow(I), title(Resp), axis on;
subplot(122), imshow(Jinv), title('Imagen procesada'), axis on;