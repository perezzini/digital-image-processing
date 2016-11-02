% Ejer02b.m: restauraci�n con Filtro de Wiener usando deconvoluci�n
clear all
close all

NomImag = input('Nombre de imagen: ', 's');
if isempty(NomImag)
    return
end

I = imread(NomImag);

%% Restauraci�n
H = modegButt(size(I), 30, 2); % degradaci�n en Fourier (OTF)
h = otf2psf(ifftshift(H)); % degradaci�n en el espacio (PSF)

Ir = deconvwnr(I, h, 0.001);
%%
figure,imshow([I Ir])