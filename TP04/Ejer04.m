%Ejer04.m: filtrado espacial y en frecuencias
clear all

I = imread('cam03.tif');
figure, imshow(I), grid on

x = double(I(167, :));

ker = [3 6 10 6 3]/28;

%%
xc = convolucion1(x, ker);
Nc = length(xc);
Nx = length(x);

figure, plot(0:Nx-1, x, -2:Nc-3, xc), grid on
legend('x', 'xc');

%% FFT

% señales extendidas para calcular ft
xe = [x zeros(1, Nc-Nx)];
kere = [ker zeros(1, Nc-5)];

X = fft(xe);
KER = fft(kere);
Xp = X.*KER; % señal filtrada en Fourier

Xc = fft(xc); % transformada de convolución

XM = abs(fftshift(X));
KM = abs(fftshift(KER));

XpM = abs(fftshift(Xp));
XcM = abs(fftshift(Xc));

if rem(Nc, 2) ~= 0 % Nc es impar
    uc = (-(Nc-1)/2:(Nc-1)/2);
else
   uc = (-Nc/2:Nc/2-1);
end

figure, subplot(211)
plot(uc, XM, uc, KM*abs(X(1))), grid on
legend('fila 167 de imágen, en Fourier', 'kernel, en Fourier')

subplot(212)
plot(uc, XpM, uc, XcM, 'o'), grid on
legend('Xp: prod. de transf. de Fourier', 'Xc: transf. de Fourier de convolución')