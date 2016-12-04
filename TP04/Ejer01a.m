% Ejer01a
clear all

Resp = input('Ingrese frecuencia [5]:', 's');
if isempty(Resp)
    Resp = '5';
end
f0 = eval(Resp); % frecuencia señal entrada

N = 512;
t = (0:N-1)/N; % eje de tiempos [0,1); delta*x
Dt = t(2) - t(1); % discretización de tiempo (Dt es cada cuanto se "muestrea" la señal x)

x = cos(2*pi*f0*t); % señal discretizada

X = fftshift(tf1(x)); % transformada de Fourier centrada ("back-to-back half periods" corregidos)

xi = ift1(ifftshift(X)); % tranformada inversa de Fourier
xi = real(xi); % nos quedamos sólo con la parte real, porque la parte real es casi cero por aproximaciones de cálculo

%%
Du = 1/Dt/N; % discretización de frecuencias. Sabemos que la DFT es una 
            % función continua e infiníta de sucesiones de períodos de la
            % transformada continua de Fourier. Como lo anterior no es
            % posible de representarlo discretamente, debemos obtener un
            % período completo de la DFT, para luego antitransformarlo y
            % obtener la función real (continua) original. Por lo tanto
            % hacemos lo siguiente: tomamos sólo N muestras de la DFT en el
            % intervalo [0, 1/Dt] (en éste intervalo hay "back-to-back 
            % half periods"); por lo tanto, tendremos "muestreos"
            % iguales de frecuencias Du = (1/Dt)/N.
            
if rem(N, 2) ~= 0 % N es impar
    u = (-(N-1)/2:(N-1)/2)*Du;
else
    u = (-N/2:N/2-1)*Du;
end

% Du*Dx = 1/N

figure, subplot(211), plot(t, x, 'o', t, xi, '.'), grid on
legend('Original', 'Antitransformada')
title('Señal de entrada'), xlabel('tiempo'), ylabel('amplitud')

subplot(212), plot(u, abs(X)), grid on
title('Espectro de la señal de entrada tranformada (abs(DFT(x)))') % se muestra sólo el intervalo u del espectro de la DFT (es decir, sólo un período)
xlabel('frecuencia'), ylabel('ampplitud')