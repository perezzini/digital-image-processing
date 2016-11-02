% Ejer02a.m: restauración con Filtro de Wiener
clear all
close all

NomImag = input('Nombre de imagen: ', 's');
if isempty(NomImag)
    return
end

I = imread(NomImag);

%% restauración
H = modegButt(size(I), 30, 2);
% con filtro inverso, si la imagen tiene ruido, se debe aumentar el factor
% de rechazo
% con filtro de Wiener, si la imagen tiene ruido, se debe aumentar la
% constate kw
Ir1 = uint8(mat2gray(fInverso(I, H, 0.2))*255); % debería dar Real, o con parte Imag en el orden de 0
Ir2 = uint8(mat2gray(fWiener(I, H, 0.1))*255);

% si me equivoco en el orden del modelo
% H = modegButt(size(I), 30, 1);
% Ir3 = uint8(mat2gray(fInverso(I, H, 0.1))*255);
% Ir4 = uint8(mat2gray(fWiener(I, H, 0.001))*255);
% 
% H = modegButt(size(I), 30, 3);
% Ir5 = uint8(mat2gray(fInverso(I, H, 0.1))*255);
% Ir6 = uint8(mat2gray(fWiener(I, H, 0.001))*255);

%%
figure,imshow([I Ir1 Ir2])
% figure,imshow([Ir3 Ir4])
% figure,imshow([Ir5 Ir6])