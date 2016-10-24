% Ejer03.m: filtros de Butterorth y gausiano
clear all
% close all

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

%%
Resp=input('Orden del filtro de Butt [1]: ','s');
if isempty(Resp)
    Resp='1';
end
orden=eval(Resp);

%% Filtrado
% Ib=fButt(I,fcorte,orden,'pb');
% Ig=fGauss(I,fcorte,'pb');
Ib=fButt(I,fcorte,orden,'pa');
Ig=fGauss(I,fcorte,'pa');

%%
Ib=uint8(mat2gray(abs(Ib))*255);
Ig=uint8(mat2gray(abs(Ig))*255);
% II=uint8(mat2gray(abs(II))*255);     % imagen filtrada final

figure,imshow(Ib),axis on
title(sprintf('%s filtrada (Butterworth) con fcorte: %d, orden: %d',NomImag,fcorte,orden))

figure,imshow(Ig),axis on
title(sprintf('%s filtrada (Gausiano) con fcorte: %d, orden: %d',NomImag,fcorte,orden))






