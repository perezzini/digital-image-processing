% Ejer02.m: segmentación por umbral manual
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

%%
h = imhist(I);
figure, plot(0:255, h), grid on

h(1) = h(2);
h(end) = h(end-1);
hc = conv(h, [1 1 1]/3, 'same'); % suavizamos el histograma

Resp = input('Ingrese umbral [127]: ', 's');
if isempty(Resp)
    Resp = '127';
end
umbral = eval(Resp);

%% Thresholding
Ibn = im2bw(I, umbral/255);

figure, imshowpair(I, Ibn, 'montage')
title(sprintf('%s segmentada con umbral %d', NomImag, umbral))