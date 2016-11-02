% Ejer01.m: restauración con Filtro Inverso
clear all
close all

NomImag = input('Nombre de imagen: ', 's');
if isempty(NomImag)
    return
end

I = imread(NomImag);

%% restauración
H = modegButt(size(I), 30, 2);
Ir1 = uint8(mat2gray(fInverso(I, H, 0.01))*255); % debería dar Real, o con parte Imag en el orden de 0
Ir2 = uint8(mat2gray(fInverso(I, H, 0.1))*255);

H = modegButt(size(I), 30, 1);
Ir3 = uint8(mat2gray(fInverso(I, H, 0.1))*255);

H = modegButt(size(I), 30, 3);
Ir4 = uint8(mat2gray(fInverso(I, H, 0.1))*255);

H = modegButt(size(I), 30, 4);
Ir5 = uint8(mat2gray(fInverso(I, H, 0.1))*255);
%%
figure,imshow([I Ir1 Ir2])
figure,imshow([Ir1 Ir3; Ir4 Ir5])