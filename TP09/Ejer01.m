% Ejer01.m: calcula descriptores
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);
%% Extrae área de interés
AdeI = imcrop(I);
close

%% Calcula parámetros
[f, c] = find(AdeI ~= 0); % coordenadas del objeto
area = length(f);
% otra forma
% area = sum(AdeI(:))/255;

ancho = max(c) - min(c);
altura = max(f) - min(f);

aspecto = ancho/altura;

rectan = area/ancho/altura;

% pAdeI = bwperim(AdeI, 8); (en 4 tengo que contar las raíces de 2)

pAdeI = bwperim(AdeI, 8);
figure, imshowpair(AdeI, pAdeI, 'montage')
title('Perímetro de la imagen de entrada')
% busca los pixels distintos de cero en el perímetro y cuenta la cantidad
% encontrada
perimetro = length(find(pAdeI ~= 0));

circul = perimetro^2/area; % cuanto más cercano a 4*pi, más circular es el objeto.

%%
fprintf('Area: %d\t\tPerímetro: %d\n', area, perimetro);
fprintf('Ancho: %d\t\tAltura: %d\t\tAspecto: %.2f\n', ancho, altura, aspecto);
fprintf('Rectangularidad: %.2f\t\tCircularidad (div 4*pi): %.2f\n', rectan, circul/4/pi);

%% Ejer02: calcula momentos
m00 = area;
m10 = sum(c - 1); % suma de coordenadas x
m01 = sum(f - 1); % suma de coordenadas y
m11 = sum((c - 1).*(f - 1)); % suma de coordenadas x*y

% momentos centrales
u00 = m00;
u11 = m11 - m10*m01/m00;

fprintf('m00 = %d\t\tm01 = %d\n', m00, m01);
fprintf('m10 = %d\t\tm11 = %d\n', m10, m11);

fprintf('u00 = %d\t\tu11 = %.2f\n', u00, u11);