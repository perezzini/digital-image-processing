function J = normaliza( I )
%J = normaliza(I)
%   Maximiza el CONTRASTE de la imagen
%   I: imagen original
%   J: imagen procesada en UINT8

% mat2gray(): transforma una matriz en el rango [0,1] uniformemente
% im2uint8(): transforma una matriz en el ranfo [0,255]

J = im2uint8(mat2gray(I));

% Otra forma:
% J = uint8(mat2gray(I)*255);
end
