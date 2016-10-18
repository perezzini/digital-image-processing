% Ejer06b.m: ventanas y espectros
clear all
close all

N=1024;

t=(0:N-1)/N;        % eje temporal [0,1)
Tm=t(2)-t(1);       % período de muestreo 1/N

V = zeros(N, 6) % matriz con ventanas (6 ventanas)

V(:, 1) = rectwin(N);
V(:, 2) = triang(N);
V(:, 3) = hamming(N);
V(:, 4) = hann(N);
V(:, 5) = gausswin(N);
V(:, 6) = blackman(N);
%%
figure, plot(t, V), grid on, title('Ventanas temporales'), legend('rect', 'triang', 'hamming', 'hann', 'gausswin',...
    'blackman')
%% En dominio de Fourier
VF = fft(V, [], 1); % FT en cada columna
VF = fftshift(VF, 1);
VFm = abs(VF);

% eje de frecuencias
Um=1/Tm/N;                 % muestreo del eje de frecuencias
if rem(N,2)~=0             % N impar
    um=(-(N-1)/2:(N-1)/2)*Um;
else
    um=(-N/2:N/2-1)*Um;
end

figure, plot(um, VFm), grid on, title('Espectros de ventanas'), legend('rect', 'triang', 'hamming', 'hann', 'gausswin',...
    'blackman')