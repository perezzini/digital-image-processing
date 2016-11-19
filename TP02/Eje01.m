% Eje01: mejora contraste
% Inicialización
clear all
close all

Resp = input('Nombre imagen: ', 's');

if isempty(Resp)
   return
end

I = imread(Resp);

linea = size(I, 1); % Cantidad de filas de I
linea = fix(linea/2); % Linea central

h = 0:size(I, 2)-1; % Coordenada horizontal
%%
% Procesamiento de imagen
J = normaliza(I);

%%
% Muestreo

figure, subplot(121), imshow(I), title(Resp), axis on;
subplot(122), imshow(J), title('Imagen procesada'), axis on;

figure, subplot(211), plot(0:255, histograma(I)), title('Histograma imagen original'), axis on;
subplot(212),plot(0:255, histograma(J)), title('Histograma imagen normalizada'), axis on;

% figure, plot(h, I(linea, :), h, J(linea, :)), grid on, legend(Resp, 'procesada')
% title(sprintf('Linea horizontal %d', linea))