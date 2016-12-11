function H = modegMov( tam, desp, Texp )
%H = modegMov( tam, desp )
% Genera función transferencia del modelo de degradación de movimiento
% (en este caso: borroneado por movimiento horizontal lineal uniforme)
%   tam: tamaño de la matriz
%       tam(1): nº de filas
%       tam(2): nº de columnas
%   desp: desplazamiento en pixeles
%   Texp: tiempo de exposición durante el que se realiza el movimiento

% consideramos que la imagen tiene ancho y alto una unidad de longitud
c=tam(2);
[FU,~]=freqspace(tam,'meshgrid');
FU=FU*c/2;
% FV no interesa

% usamos desp/c porque considera que la imagen tiene ancho = 1 (ver Cap 4)
H = Texp*sinc(FU*desp/c).*exp(-1i*pi*FU*desp/c);

end

