%Ejer02a: uso de fft2()
clear all

N = 256;
f0 = 5;
t = (0:N-1)/N;

x = mat2gray(cos(2*pi*f0*t));

figure, plot(t, x), grid on

I = repmat(x, size(x'));

figure, imshow(I)

%% Transformada de Fourier 2D
If = fftshift(fft2(I)); % transformada de I

figure, imshow(mat2gray(abs(If)))