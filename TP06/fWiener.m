function Ir = fWiener( I, H, kw )
%function Ir = fWiener( I, H, kw )
%   Filtro de Wiener de degradaci�n
%       I: imagen degradada
%       H: funci�n (en Fourier) de degradaci�n (tambi�n llamada funci�n
%       transferencia)
%       kw: par�metro del filtro
%       rechazo: par�metro del filtro inverso; rechazo del filtro
%       (opcional)
%       Ir: imagen restaurada

G = fftshift(fft2(I));

%% Filtro de Wiener
H2 = abs(H).^2;
F = zeros(size(I));

F(H2 > 0) = H2(H2 > 0)./(H2(H2 > 0) + kw).*G(H2 > 0)./H(H2 > 0);

%%
Ir = ifft2(ifftshift(F));
end