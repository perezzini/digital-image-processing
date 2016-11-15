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
% L = 255:-1:0;
% Jinv = aplicaLUT(I, L);

% LOGARITMICA
% L = uint8(log((0:255)+1)/log(256)*255);
% Jlogg = aplicaLUT(I, L);

% LOGARITMICA (aplicando la función normaliza())
L = normaliza(log((0:255)+1));
Jlog = aplicaLUT(I, L);

% POWER-LAW TRANSFORMATION con gamma = 0.20
% L = uint8(((0:255).^0.20)/(256^0.20)*255);
% Jpower = aplicaLUT(I, L);
%%
figure, subplot(121), imshow(I), title(Resp), axis on;
subplot(122), imshow(Jlog), title('Imagen procesada'), axis on;