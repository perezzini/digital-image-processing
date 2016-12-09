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

%% Filtrado
% Ifil=IF.*F;
Ifil=IF;

% Eliminación de ciclos diagonales
Ifil(109,119)=0;
Ifil(149,139)=0;

% Eliminación de cliclos verticales
Ifil(129,219)=0;
Ifil(129,39)=0;

II=ifft2(ifftshift(Ifil));      % imagen filtrada

II=uint8(mat2gray(II)*255);     % imagen filtrada final
% II=uint8(mat2gray(abs(II))*255);     % imagen filtrada final
figure,imshow(II),axis on
title('Imagen retocada')

Ifilm=abs(Ifil);
figure, imshow(mat2gray(log(Ifilm+1))),title('log del espectro de FT (imagen retocada)')











