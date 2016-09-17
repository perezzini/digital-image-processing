% Eje05: ecualización local de imágenes
% Inicialización
clear all
close all

Resp = input('Nombre imagen: ', 's');

if isempty(Resp)
   return
end

Tira = input('Tamaño de ventana: ', 's');

if isempty(Tira)
   return
end

I = imread(Resp);
%%
% Ventanas
v = eval(Tira);
% ventana media para movilización en la imagen
v2 = fix(v/2);

X = zeros([v v], 'uint8'); % variable temporal
J = I;
[fil, col] = size(I);

%% Ecualización local
for c = v2+1:col-v2
%     disp(c)
    for f = v2+1:fil-v2
        X = histeq(I(f-v2:f+v2, c-v2:c+v2));
        J(f, c) = X(v2+1, v2+1); % se queda con pixel central
    end
end

%% Muestreo
figure, imshow([I J])

figure, subplot(211), imhist(I), title('Original')
subplot(212), imhist(J), title('Procesada')