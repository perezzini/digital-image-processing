%Ejer04.m: filtrado espacial y en frecuencias
clear all
close all

I = imread('cam03.tif');
figure, imshow(I), grid on

x = double(I(167, :));

ker = [3 6 10 6 3]/28;

%%
xc = convolucion1(x, ker); % convolucion1() extiende se�ales x y ker
Nc = length(xc);
Nx = length(x);

figure, plot(0:Nx-1, x, -2:Nc-3, xc), grid on
legend('x: fila 167', 'xc: convoluci�n de x con ker');

%% FFT

% se�ales extendidas para calcular ft
xe = [x zeros(1, Nc-Nx)]; % fila
kere = [ker zeros(1, Nc-5)]; % kernel

X = fft(xe);
KER = fft(kere);
Xp = X.*KER; % se�al filtrada en Fourier

Xc = fft(xc); % transformada de convoluci�n

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
legend('Espectro de la FT de la fila 167 de la im�gen', 'Espectro de la FT del kernel')

subplot(212)
plot(uc, XpM, '.', uc, XcM, 'o'), grid on
legend('Xp: espectro del prod. de la FT', 'Xc: espectro de la FT de convoluci�n')