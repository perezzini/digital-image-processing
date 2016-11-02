function H=modegButt(tam,fc,orden)
%function H=modegButt(tam,fc,orden)
% Genera funci�n transferencia del modelo de degradaci�n
% (en este caso un filtro de Butterworth pasabajos)
%   tam: tama�o de la matriz
%       tam(1): filas
%       tam(2): columnas
%   fc: frecuencia de corte del filtro Butterworth
%   orden: orden del filtro Butterworth

f=tam(1);
c=tam(2);
[FU,FV]=freqspace(tam,'meshgrid');
FU=FU*c/2;
FV=FV*f/2;
D2=(FU.^2+FV.^2)/fc^2;
H=1./(1+D2.^orden);

end

