function Ir = fWiener( I, H, kw )
%function Ir = fWiener( I, H, kw )
%   Filtro de Wiener de degradación
%       I: imagen degradada
%       H: función (en Fourier) de degradación (también llamada función
%       transferencia)
%       kw: parámetro del filtro
%       rechazo: parámetro del filtro inverso; rechazo del filtro
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