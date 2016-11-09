% Ejer03a.m: selecciona umbral según la proporción de píxeles oscuros
% (fondo)
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

Resp = input('Proporción de píxeles oscuros [0:1]:', 's');
if isempty(Resp)
    return
end

posc = eval(Resp);
%% busca umbral
h=imhist(I)/numel(I);

ha=cumsum(h); % suma acumulada del histograma
c=find(ha>=posc);           % subíndices donde ha>=posc

%% segmentación
umbral=c(1)-1;              % primer subíndice donde ha>=posc
Ibn=im2bw(I,umbral/255);    % segmentación

%%
figure,imshowpair(I,Ibn,'montage')
title(sprintf('%s segmentada con umbral %d',NomImag,umbral))