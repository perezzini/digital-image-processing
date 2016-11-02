function Ir = fInverso( I, H, rechazo )
%Ir = fInverso( I, fc, orden )
%   Filtro Inverso de restauraci�n de imagen
%       I: imagen degradada
%       H: funci�n (en Fourier) de degradaci�n (tambi�n llamada funci�n
%       transferencia)
%       rechazo: par�metro del filtro inverso; rechazo del filtro
%       Ir: imagen restaurada

G = fftshift(fft2(I));
%% filtro inverso
% F = G/H (ya que consideramos R = 0, porque no lo conocemos)

F = G;
% F = zeros(size(I));
% F(abs(H) ~= 0) = G(abs(H) ~= 0)./H(abs(H) ~= 0); % estimador de la imagen original
% Hacemos lo sig porque no conocemos el ruido, entonces "intentamos" anularlo un poco
F(abs(H) >= rechazo) = G(abs(H) >= rechazo)./H(abs(H) >= rechazo);
%% antitransformamos
Ir = ifft2(ifftshift(F));
end