% Ejer04.m: filtro homomórfico
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
[f,c]=size(I);
[FU,FV]=freqspace(size(I),'meshgrid');
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

%% Filtro homomórfico
Ilog=log(double(I)+1);
Ifil=fGauss(Ilog,fcorte,'pb');     % aplicamos algún filtro
Ih=exp(Ifil)-1;                    % imagen filtrada

%% Filtro común
Ig=fGauss(I,fcorte,'pb');     % aplicamos algún filtro

%%
figure,imshow([uint8(mat2gray(Ig)*255) uint8(mat2gray(Ih)*255)])
title(sprintf('%s filtrada con fcorte: %d',NomImag,fcorte))







