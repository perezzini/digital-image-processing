function J = normaliza( I )
%J = normaliza(I)
%   Maximiza el CONTRASTE de al imagen
%   I: imagen original
%   J: imagen procesada en UINT8

% mat2gray(): transforma una matriz en el rango [0,1] uniformemente

J = im2uint8(mat2gray(I));

% Otra forma:
% J = uint8(mat2gray(I)*255);
end
