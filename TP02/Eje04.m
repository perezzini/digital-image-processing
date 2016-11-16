% Eje04: ecualización de imágenes
% Inicialización
clear all
%close all

Resp = input('Nombre imagen: ', 's');

if isempty(Resp)
   return
end

I = imread(Resp);
%%
J = ecualizar(I);

hi = histograma(I);
hj = histograma(J);
%%
figure, imshow([I J])

figure, subplot(211), plot(0:255, hi), title('Original'), grid on
subplot(212),plot(0:255, hj), title('Procesada'), grid on

% imhist() no devuelve un histograma normalizado. Para ésto podemos usar, 
% por ejemplo, plot(0:255, hi)