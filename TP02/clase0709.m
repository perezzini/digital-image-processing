% LUT para procesar arroz.tif
% Inicialización
clear all
close all

Resp = input('Nombre imagen: ', 's');

if isempty(Resp)
   return
end

I = imread(Resp);
%%
I = normaliza(I);

L = zeros(1, 256, 'uint8');
L(81:101) = 127;
L(102:end) = 255;

J = aplicaLUT(I, L);
%%
figure, subplot(121), imshow(I), title(Resp), axis on;
subplot(122), imshow(J), title('Imagen procesada'), axis on;