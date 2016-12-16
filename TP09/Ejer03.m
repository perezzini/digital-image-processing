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
%% Calcula histograma normalizado del área de interés
h = histograma(AdeI);
figure, plot(0:255, h, 'o'), grid on, title('Histograma normalizado de área de interés')
%% Calcula suavidad
vmedio = mean2(AdeI); % PROMEDIO de todos los valores de grises de la imagen
% vmedio = sum(mean(AdeI))/length(mean(AdeI))

varianza = (std2(AdeI))^2; % std2() calcula el desvío estándar
suavidad = varianza/(1 + varianza); % parámetro de la textura (si es igual a 0, es una textura "plana")

fprintf('Suavidad: %.4f\t\tLogS: %f\n', suavidad, -log(suavidad)*1000);
fprintf('vmedio: %.2f\t\tVarianza: %.2f\n', vmedio, varianza);
fprintf('std (cuán dispersos están las intensidades con respecto al valor medio): %.2f\n', std2(AdeI));