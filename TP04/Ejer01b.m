% Ejer01b: comparación de transformada discreta y contínua
clear all

N = 512;
t = linspace(0, 4, N); % eje de tiempos
Dt = t(2)-t(1);

Du = 1/Dt/N; % discretización de frecuencias
if rem(N, 2) ~= 0 % N es impar
    u = (-(N-1)/2:(N-1)/2)*Du;
else
   u = (-N/2:N/2-1)*Du;
end

%%
x = 2*exp(-3*t); % señal temporal discretizada
Xf = fftshift(fft(x)); % transformada de Fourier centrada

Xa = 2./(3+1i*2*pi*u); % transformada analítica discretizada con las frecuencias

%%
figure, plot(u, abs(Xa), u, abs(Xf)*Dt, 'o'), grid on
legend('FT Analítica', 'FT discreta')