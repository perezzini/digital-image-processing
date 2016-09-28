% Ejer01a
clear all

Resp = input('Ingrese frecuencia [5]:', 's');
if isempty(Resp)
    Resp = '5';
end
f0 = eval(Resp); % frecuencia se�al entrada

N = 512;
t = (0:N-1)/N; % eje de tiempos [0,1); delta*x
Dt = t(2) - t(1); % discretizaci�n de tiempo DeltaT

x = cos(2*pi*f0*t); % se�al discretizada

X = fftshift(tf1(x)); % transformada de Fourier centrada

xi = ift1(ifftshift(X)); % tranformada inversa de Fourier
xi = real(xi); % nos quedamos s�lo con la parte real, porque la parte real es casi cero por aproximaciones de c�lculo

%%
Du = 1/Dt/N; % discretizaci�n de frecuencias
if rem(N, 2) ~= 0 % N es impar
    u = (-(N-1)/2:(N-1)/2)*Du;
else
   u = (-N/2:N/2-1)*Du;
end

% Du*Dx = 1/N

figure, subplot(211), plot(t, x, t, xi, '.'), grid on
legend('Original', 'Antitransformada');
title('Se�al de entrada')

subplot(212), plot(u, abs(X)), grid on
title('Se�al tranformada')