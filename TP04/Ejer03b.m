% Ejer03b.m: convolución 1D
clear all
close all

N = 30;
x1 = ones(N, 1);
x2 = ones(N, 1)*0.5;

c1 = convolucion1(x1, x2);
c2 = conv(x1, x2, 'full'); % convolución con MATLAB

Nc = length(c1);

figure, subplot(221), plot(0:N-1, x1, 0:N-1, x2), grid on
legend('x1', 'x2')

subplot(212), plot(0:Nc-1, c1, 0:Nc-1, c2, 'o'), grid on
legend('conv1D', 'conv MATLAB');