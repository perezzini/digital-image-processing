% Ejer05.m: muestreo
clear all
close all

f0 = 50;
tini = 0;
tfin = 0.2;

%% Simulación de señal continua
Fc = 10000; % frecuencia de muestreo en 10KHz
Tc = 1/Fc; % 1/(1/dT)
tc = tini:Tc:tfin; % tiempo "continuo"
tc(end) = []; % intervalo abierto

xc = cos(2*pi*f0*tc); % señal "continua"

%% Señal discretizada
Fm = 2*f0; %mínima frecuencia de muestreo sugerida (2*W, véase teoría)
cartel = sprintf('Ingrese frecuencia de muestreo (>=%.1f): ', Fm);
Resp = input(cartel, 's');
if ~isempty(Resp)
    Fm = eval(Resp);
end

Tm = 1/Fm;  % período de muestreo
tm = tini:Tm:tfin;  % tiempo discreto
tm(end) = [];   % [0, 0.2)

xm = cos(2*pi*f0*tm);   % señal discretizada

%% Grafico de señales
figure, plot(tc, xc, tm, xm, '-o'), grid on
legend('Señal "continua"', 'Señal discreta')
title('Análisis temporal')

%% Análisis en frecuencia
Nc = length(tc);
Uc = Fc/Nc; % muestreo del eje "continuo"

if rem(Nc, 2) ~= 0 % Nc es impar
    uc = (-(Nc-1)/2:(Nc-1)/2)*Uc;
else
   uc = (-Nc/2:Nc/2-1)*Uc;
end

Xc = fftshift(fft(xc)); % FT de señal "continua"

Nm = length(tm);
Um = Fm/Nm; % muestreo del eje de frecuencias discreto

if rem(Nm, 2) ~= 0 % Nm es impar
    um = (-(Nm-1)/2:(Nm-1)/2)*Um;
else
   um = (-Nm/2:Nm/2-1)*Um;
end

Xm = fftshift(fft(xm)); % FT de señal discretizada

figure, plot(uc, abs(Xc)*Tc, um, abs(Xm)*Tm, 'o-')
legend('Señal "continua"', 'Señal discretizada')
title('Análisis de Fourier')