%Ejer03.m: filtrado con imfilter()
clear all
% close all

Resp=input('Nombre imagen: ','s');
if isempty(Resp)
    return
end
I=imread(Resp);

%% Promedio cuadrado (funciona bien para reducir el ruido gaussiano)
Resp=input('Tamaño kernel [3]: ','s');
if isempty(Resp)
    Resp='3';
end
Tk=eval(Resp);

ker=fspecial('average',[Tk Tk]);    % es igual que fspecial('average',Tk)
Ia=imfilter(I,ker);

figure,imshow([I Ia]),title(sprintf('Average kernel %dx%d',Tk,Tk))

%% Promedio circular (funciona bien para reducir el ruido gaussiano)
Resp=input('Radio kernel [1]: ','s');
if isempty(Resp)
    Resp='1';
end
Tk=eval(Resp);

ker=fspecial('disk',Tk);
Ic=imfilter(I,ker);

figure,imshow([I Ic]),title(sprintf('Disco radio %d',Tk))

%% Gaussiano
Resp=input('Tamaño kernel [3]: ','s');
if isempty(Resp)
    Resp='3';
end
Tk=eval(Resp);

Resp=input('Sigma [0.5]: ','s');
if isempty(Resp)
    Resp='0.5';
end
sigma_ker=eval(Resp);

ker=fspecial('gaussian',[Tk Tk],sigma_ker);
Ig=imfilter(I,ker);

figure,imshow([I Ig])
title(sprintf('Gausiano kernel %dx%d, sigma %.1f',Tk,Tk,sigma_ker))





