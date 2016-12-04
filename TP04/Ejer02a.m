%Ejer02a: uso de fft2()
clear all

N = 256;
f0 = 5;
t = (0:N-1)/N;
Dt = t(2)-t(1);

Du = 1/Dt/N; % discretización de frecuencias
if rem(N, 2) ~= 0 % N es impar
    u = (-(N-1)/2:(N-1)/2)*Du;
else
    u = (-N/2:N/2-1)*Du;
end

x1D = cos(2*pi*f0*t);
x2D = mat2gray(cos(2*pi*f0*t));

figure, plot(t, x2D), grid on, title('Señal')

I = repmat(x2D, size(x2D'));

figure, imshow(I), title('Señal')

%% Transformada de Fourier 1D
Xf = fftshift(fft(x1D));
figure, plot(u, abs(Xf)), grid on
title('Espectro de la DFT de la señal (en 1D)')

%% Transformada de Fourier 2D
If = fftshift(fft2(I)); % transformada de I

figure, imshow(mat2gray(abs(If))), title('Espectro de la DFT de la señal (en 2D)')