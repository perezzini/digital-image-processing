% Ejer03c.m: Convolución y transformadas de Fourier
clear all
close all

N = 1024;
to = (0:N-1)/N; % intervalo [0,1)
To = to(2)-to(1); % período de muestreo
f1 = 5;
f2 = 7;
x1 = cos(2*pi*f1*to);
x2 = cos(2*pi*f2*to);

%% convolución
xc = convolucion1(x1, x2);
Nc = length(xc);
tc = (0:Nc-1)*To; % eje tiempo final

figure, subplot(211)
plot(to, [x1; x2]), grid on
legend('x1', 'x2')

subplot(212)
plot(tc, xc), grid on
title('Convolución')

%% transformadas de Fourier

% señales extendidas para calcular ft
x1c =  [x1 zeros(1, Nc-N)];
x2c =  [x2 zeros(1, Nc-N)];

X1 = fft(x1c);
X2 = fft(x2c);
X1_mod = abs(fftshift(X1));
X2_mod = abs(fftshift(X2));

Xp = X1.*X2; % producto de las transformadas

Xc = fft(xc); % transformada de la convolución

% módulos de las transformadas
Xp_mod = abs(fftshift(Xp));
Xc_mod = abs(fftshift(Xc));

Uc = 1/Nc/To; % ambos ejes temporales tienen igual período de muestreo

if rem(Nc, 2) ~= 0 % Nc es impar
    uc = (-(Nc-1)/2:(Nc-1)/2)*Uc;
else
   uc = (-Nc/2:Nc/2-1)*Uc;
end

figure, subplot(211)
plot(uc, [X1_mod; X2_mod]), grid on
legend('X1', 'X2')

subplot(212)
plot(uc, Xp_mod, uc, Xc_mod, 'o'), grid on
legend('Xp', 'Xc')
