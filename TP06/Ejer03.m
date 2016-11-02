% Ejer03.m: restauración de borroneado por  movimiento uniforme
clear all
close all

NomImag = input('Nombre de imagen: ', 's');
if isempty(NomImag)
    return
end

I = imread(NomImag);

%% Restauración
H = modegMov(size(I), 20, 1);
Ir1 = uint8(mat2gray(real(fInverso(I, H, 0.01)))*255); % fInverso (al ser ifft) debería dar Real, o con parte Imag en el orden de 0
Ir2 = uint8(mat2gray(real(fWiener(I, H, 0.001)))*255);

%%
figure,imshow([I Ir1 Ir2])