% Eje02: calcula histograma
% Inicialización
clear all
close all

Resp = input('Nombre imagen: ', 's');

if isempty(Resp)
   return
end

I = imread(Resp);

%%
% Procesamiento de imagen
J = normaliza(I);

hi = histograma(I);
% [hi, x] = imhist(I); otra forma
hj = histograma(J);
% [hj, x] = imhist(J); otra forma
%%
% Muestreo

figure, subplot(121), imshow(I), title(Resp), axis on;
subplot(122), imshow(J), title('Imagen procesada'), axis on;

figure, subplot(211), plot(0:255, hi, '.'), grid on, title('Histograma original')
subplot(212), plot(0:255, hj, '.'), grid on, title('Histograma imagen procesada')