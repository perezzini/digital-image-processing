% Ejer01.m
clear all
close all

NomImag=input('Ingrese nombre imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);
figure,imshow(I),title(NomImag)
axis on

%%
IF=fftshift(fft2(I));
IFm=abs(IF);
figure,imshow(mat2gray(log(IFm+1))),title('log del espectro de FT')

%% Filtro en Fourier
[f,c]=size(IF);
[FU,FV]=freqspace(size(IF),'meshgrid');
FU=FU*c/2;
FV=FV*f/2;

fMax=min([max(FU(:)) max(FV(:))]);
Mensaje=sprintf('Frecuencia de corte 0<=fc<=[%d]: ',fMax);
Resp=input(Mensaje,'s');
if isempty(Resp)
    fcorte=fMax;
else
    fcorte=eval(Resp);
end
if (fcorte<0 || fcorte>fMax)
    error('Frecuencia de corte errónea')
end

%Armamos el filtro
F=zeros(size(IF));      % filtro
D=sqrt(FU.^2+FV.^2);    % módulos de frecuencias

% filtro pasabajos circular
F(D<=fcorte)=1;

% filtro pasabajos rectangular
% F(abs(FU)<=fcorte & abs(FV)<=fcorte)=1;

% Filtro pasa altos
F=1-F;

figure,imshow(F),axis on, grid on


%% Filtrado
Ifil=IF.*F;
II=ifft2(ifftshift(Ifil));      % imagen filtrada

II=uint8(mat2gray(abs(II))*255);     % imagen filtrada final
figure,imshow(II),axis on
title(sprintf('%s filtrada con fcorte: %d',NomImag,fcorte))











