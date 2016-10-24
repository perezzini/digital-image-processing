function Ifil=fGauss(I,fc,tipo)
%Filtro gausiano
% Ifil=fGauss(I,fc,tipo)
%   I: imagen original
%   fc: frecuencia de corte
%   tipo: tipo de filtro
%           'pb': pasa bajos
%           'pa': pasa altos
%   Ifil: imagen filtrada
[f,c]=size(I);
[FU,FV]=freqspace(size(I),'meshgrid');
FU=FU*c/2;
FV=FV*f/2;

D=FU.^2+FV.^2;          % distancia^2 al origen de frecuencias
D2=D/fc^2;
F=exp(-pi*D2);          % filtro gausiano

if strcmpi(tipo,'pa');
    F=1-F;
end

IF=fftshift(fft2(I));
IF=IF.*F;

Ifil=ifft2(ifftshift(IF));
end

