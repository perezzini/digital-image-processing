% Ejer02a.m: uso de ventana en la imagen

clear all
close all

NomImag=input('Ingrese nombre imagen: ','s');
if isempty(NomImag)
    return
end

I=imread(NomImag);

%% Arma ventana rectangular
[f,c]=size(I);
hv=hann(f);
hh=hann(c)';
hr=sqrt(hv*hh);     % ventana rectangular

% figure,mesh(hr),grid on

%% Multiplica imagen con ventana
Ih=uint8(double(I).*hr);

figure,imshow([I Ih]),title(NomImag)
axis on

%% Calcula FT
IF=fftshift(fft2(I));
IFm=abs(IF);

IFh=fftshift(fft2(Ih));
IFhm=abs(IFh);
figure,imshow([mat2gray(log(IFm+1)) mat2gray(log(IFhm+1))])
title('log de FT')

%% Arma filtro

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

% % filtro pasabajos circular
F(D<=fcorte)=1;

% filtro pasabajos rectangular
% F(abs(FU)<=fcorte & abs(FV)<=fcorte)=1;

% Filtro pasa altos
% F=1-F;
figure,imshow(F),axis on, grid on

%% Filtrado
Ifil=IF.*F;
Ihfil=IFh.*F;       % FT de imagen con ventana

%%
II=ifft2(ifftshift(Ifil));      % imagen filtrada
IIh=ifft2(ifftshift(Ihfil));    % imagen filtrada

II=uint8(mat2gray(II)*255);     % imagen filtrada final
IIh=uint8(mat2gray(IIh)*255);   % imagen filtrada final

figure,imshow([II IIh]),axis on
title(sprintf('%s filtrada con fcorte: %d',NomImag,fcorte))









