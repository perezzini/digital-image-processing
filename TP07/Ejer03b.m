% Ejer03b.m: busca umbral como mínimo entre dos máximos del histograma
clear all
close all

NomImag=input('Nombre de imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);
%% Calcula histograma
h=imhist(I);
figure,subplot(211)
plot(0:255,h),grid on, title('Histograma')

h(1)=h(2);
h(end)=h(end-1);                % para evitar pico de saturación

%% Busca máximos
[~,M1]=max(h);      % posición del máximo, o primero, global
d=((1:256)'-M1).^2; % distancia a M1

hp=h.*d;            % histograma pesado

subplot(212)
plot(0:255,hp),grid on, title('Histograma pesado por distancia')

[~,M2]=max(hp);      % posición del segundo máximo

%% Busca mínimo
if M1<M2
    [~,V]=min(h(M1:M2));
    V=V+M1-1; % se resta 1 porque los niveles de grises se encuentran en [0:255]
else    % M2<M1
    [~,V]=min(h(M2:M1));
    V=V+M2-1;
end

%% Segmentación

umbral=V-1;     % umbral de segmentación
Ibn=im2bw(I,umbral/255);    % segmentación

%%
figure,imshowpair(I,Ibn,'montage')
title(sprintf('%s segmentada con umbral %d',NomImag,umbral))

%% Método de Otsu
Oumbral = graythresh(I); % umbral usando método de Otsu

Io = im2bw(I, Oumbral);

figure, imshowpair(I, Io, 'montage')
title(sprintf('%s segmentada (método de Otsu) con umbral %d', NomImag, Oumbral*255)) % Oumbral está entre 0 y 1
