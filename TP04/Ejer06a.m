% Ejer06a.m
clear all
close all

N=1024;
f1=5;
f2=4.5;

t=(0:N-1)/N;        % eje temporal [0,1)
Tm=t(2)-t(1);       % período de muestreo 1/N

x1=cos(2*pi*f1*t);
x2=cos(2*pi*f2*t);

%%
figure,plot(t,x1,t,x2),grid on
legend('x1','x2')

%%
Um=1/Tm/N;                 % muestreo del eje de frecuencias
if rem(N,2)~=0             % N impar
    um=(-(N-1)/2:(N-1)/2)*Um;
else
    um=(-N/2:N/2-1)*Um;
end

X1=fftshift(fft(x1));
X2=fftshift(fft(x2));

%%
figure,plot(um,abs(X1),um,abs(X2),'-o'),grid on
legend('X1','X2')






