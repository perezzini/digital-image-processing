%Ejer05.m: filtros derivativos
clear all
close all

Resp=input('Nombre imagen: ','s');
if isempty(Resp)
    return
end
I=imread(Resp);

%% Derivadas horizontales y verticales
% ker = [0 -1; 0 1];
% Dx = imfilter(I, ker); % bordes "horizontales"
% 
% ker = ker.';
% Dy = imfilter(I, ker); % bordes "verticales"
% 
% D = imlincomb(0.5, Dx, 0.5, Dy); % imfilter() deja todo positivo. Combinación de ambas derivadas
% 
% figure, imshow([I D; Dx Dy]), title('Derivadas horizontales y verticales')

%% Derivadas a 45º (Roberts)
ker = [-1 0; 0 1];
R1 = imfilter(I, ker);

ker = [0 -1; 1 0];
R2 = imfilter(I, ker);

R = imlincomb(0.5, R1, 0.5, R2); % imfilter() deja todo positivo. Combinación de ambas derivadas

figure, imshow([I R; R1 R2]), title('Roberts. Derivadas a 45º')

%% Prewitt
% ker = fspecial('prewitt');
% P1 = imfilter(I, ker); % horizontal
% P2 = imfilter(I, ker.'); % vertical
% 
% P = imlincomb(0.5, P1, 0.5, P2);
% 
% figure, imshow([I P; P1 P2]), title('Prewitt')

%% Sobel
% ker = fspecial('sobel');
% S1 = imfilter(I, ker); % horizontal
% S2 = imfilter(I, ker.'); % vertical
% 
% S = imlincomb(0.5, S1, 0.5, S2);
% 
% figure, imshow([I S; S1 S2]), title('Sobel')

%% Laplaciano
% Resp=input('Parámetro de forma [0.5]: ', 's');
% if isempty(Resp)
%     Resp='0.5';
% end
% alfa=eval(Resp);
% 
% ker = fspecial('laplacian', alfa); % 3x3 by defect ker
% L = imfilter(I, ker);
% 
% figure, imshow([I, L]), title('Laplaciano');