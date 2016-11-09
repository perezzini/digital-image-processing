% Ejer03a.m: selecciona umbral seg�n la proporci�n de p�xeles oscuros
% (fondo)
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

Resp = input('Proporci�n de p�xeles oscuros [0:1]:', 's');
if isempty(Resp)
    return
end

posc = eval(Resp);
%% busca umbral
h=imhist(I)/numel(I);

ha=cumsum(h); % suma acumulada del histograma
c=find(ha>=posc);           % sub�ndices donde ha>=posc

%% segmentaci�n
umbral=c(1)-1;              % primer sub�ndice donde ha>=posc
Ibn=im2bw(I,umbral/255);    % segmentaci�n

%%
figure,imshowpair(I,Ibn,'montage')
title(sprintf('%s segmentada con umbral %d',NomImag,umbral))