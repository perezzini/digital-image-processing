% Ejer03.m: calcula suavidad en texturas
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

%% Calcula suavidad
vmedio = mean2(AdeI); % promedio de todos los valores de grises de la imagen

varianza = (std2(AdeI))^2;
suavidad = varianza/(1 + varianza); % parámetro de la textura

fprintf('Suavidad: %.4f\t\tLogS: %f\n', suavidad, -log(suavidad)*1000);
fprintf('vmedio: %.2f\t\tVarianza: %.2f\n', vmedio, varianza);