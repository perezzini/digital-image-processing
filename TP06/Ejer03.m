% Ejer03.m: restauraci�n de borroneado por  movimiento uniforme
clear all
close all

NomImag = input('Nombre de imagen: ', 's');
if isempty(NomImag)
    return
end

I = imread(NomImag);

%% Restauraci�n
H = modegMov(size(I), 20, 1);
Ir1 = uint8(mat2gray(real(fInverso(I, H, 0.01)))*255); % fInverso (al ser ifft) deber�a dar Real, o con parte Imag en el orden de 0
Ir2 = uint8(mat2gray(real(fWiener(I, H, 0.001)))*255);

%%
figure,imshow([I Ir1 Ir2])