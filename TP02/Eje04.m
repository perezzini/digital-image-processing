% Eje04: ecualizaci�n de im�genes
% Inicializaci�n
clear all
close all

Resp = input('Nombre imagen: ', 's');

if isempty(Resp)
   return
end

I = imread(Resp);
%%
J = ecualizar(I);
%%
figure, imshow([I J])

figure, subplot(211), imhist(I), title('Original')
subplot(212), imhist(J), title('Procesada')