% Ejer06c.m: señales con ventanas y espectros
clear all
close all

N=1024;
f1=5;
f2=4.5;

t=(0:N-1)'/N;        % eje temporal [0,1)
Tm=t(2)-t(1);       % período de muestreo 1/N

x1=cos(2*pi*f1*t);
x2=cos(2*pi*f2*t);
%%
V = zeros(N, 6) % matriz con ventanas (6 ventanas)

V(:, 1) = rectwin(N);
V(:, 2) = triang(N);
V(:, 3) = hamming(N);
V(:, 4) = hann(N);
V(:, 5) = gausswin(N);
V(:, 6) = blackman(N);

x1v = repmat(x1, 1, 6).*V; % señal x1 con ventanas
x2v = repmat(x2, 1, 6).*V; % señal x2 con ventanas
%%
figure, plot(t, x1v), grid on, title('x1 con ventanas'), legend('rect', 'triang', 'hamming', 'hann', 'gausswin',...
    'blackman')

figure, plot(t, x2v), grid on, title('x2 con ventanas'), legend('rect', 'triang', 'hamming', 'hann', 'gausswin',...
    'blackman')
%% En dominio de Fourier
X1F = fft(x1v, [], 1); % FT en cada columna
X1F = fftshift(X1F, 1);
X1Fm = abs(X1F);

X2F = fft(x2v, [], 1); % FT en cada columna
X2F = fftshift(X2F, 1);
X2Fm = abs(X2F);

% eje de frecuencias
Um=1/Tm/N;                 % muestreo del eje de frecuencias
if rem(N,2)~=0             % N impar
    um=(-(N-1)/2:(N-1)/2)*Um;
else
    um=(-N/2:N/2-1)*Um;
end

figure, plot(um, X1Fm), grid on, title('Espectros de x1 con ventanas'), legend('rect', 'triang', 'hamming', 'hann', 'gausswin',...
    'blackman')

figure, plot(um, X2Fm), grid on, title('Espectros de x2 con ventanas'), legend('rect', 'triang', 'hamming', 'hann', 'gausswin',...
    'blackman')