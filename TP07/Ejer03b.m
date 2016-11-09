% Ejer03b.m: busca umbral como m�nimo entre dos m�ximos del histograma
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
h(end)=h(end-1);                % para evitar pico de saturaci�n

%% Busca m�ximos
[~,M1]=max(h);      % posici�n del m�ximo, o primero, global
d=((1:256)'-M1).^2; % distancia a M1

hp=h.*d;            % histograma pesado

subplot(212)
plot(0:255,hp),grid on, title('Histograma pesado por distancia')

[~,M2]=max(hp);      % posici�n del segundo m�ximo

%% Busca m�nimo
if M1<M2
    [~,V]=min(h(M1:M2));
    V=V+M1-1; % se resta 1 porque los niveles de grises se encuentran en [0:255]
else    % M2<M1
    [~,V]=min(h(M2:M1));
    V=V+M2-1;
end

%% Segmentaci�n

umbral=V-1;     % umbral de segmentaci�n
Ibn=im2bw(I,umbral/255);    % segmentaci�n

%%
figure,imshowpair(I,Ibn,'montage')
title(sprintf('%s segmentada con umbral %d',NomImag,umbral))

%% M�todo de Otsu
Oumbral = graythresh(I); % umbral usando m�todo de Otsu

Io = im2bw(I, Oumbral);

figure, imshowpair(I, Io, 'montage')
title(sprintf('%s segmentada (m�todo de Otsu) con umbral %d', NomImag, Oumbral*255)) % Oumbral est� entre 0 y 1
