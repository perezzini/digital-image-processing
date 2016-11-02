% Ejer02b.m: restauración con Filtro de Wiener usando deconvolución
clear all
close all

NomImag = input('Nombre de imagen: ', 's');
if isempty(NomImag)
    return
end

I = imread(NomImag);

%% Restauración
H = modegButt(size(I), 30, 2); % degradación en Fourier (OTF)
h = otf2psf(ifftshift(H)); % degradación en el espacio (PSF)

Ir = deconvwnr(I, h, 0.001);
%%
figure,imshow([I Ir])