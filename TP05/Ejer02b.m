% Ejer02b.m: uso de ventana en dominio de frecuencias
clear all
close all

NomImag=input('Ingrese nombre imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

%%
IF=fftshift(fft2(I));
IFm=abs(IF);

figure,imshow(mat2gray(log(IFm+1)))
title('log de espectro de FT')

%% Arma filtro
[f,c]=size(IF);
[FU,FV]=freqspace(size(IF),'meshgrid');
FU=FU*c/2;
FV=FV*f/2;

fMax=min([max(FU(:)) max(FV(:))])/1.5;
Mensaje=sprintf('Frecuencia de corte 0<=fc<=[%.1f]: ',fMax);
Resp=input(Mensaje,'s');
if isempty(Resp)
    fcorte=fMax;
else
    fcorte=eval(Resp);
end
if (fcorte<0 || fcorte>fMax)
    error('Frecuencia de corte errónea')
end
fcorte=fcorte*1.5;      % para que no atenúe frecuencias cercanas a fcorte

hv=hann(2*fcorte+1);
hh=hann(2*fcorte+1)';
hr=sqrt(hv*hh);         % ventana rectangular

%Armamos el filtro
F=zeros(size(IF));      % filtro

% filtro pasabajos rectangular
F(abs(FU)<=fcorte & abs(FV)<=fcorte)=hr;

% Filtro pasa altos
% F=1-F;
figure,imshow(F),axis on, grid on

%% Filtrado
Ifil=IF.*F;
II=ifft2(ifftshift(Ifil));      % imagen filtrada

II=uint8(mat2gray(II)*255);     % imagen filtrada final
% II=uint8(mat2gray(abs(II))*255);     % imagen filtrada final
figure,imshow([I II]),axis on
title(sprintf('%s filtrada con fcorte: %.1f',NomImag,fcorte))




