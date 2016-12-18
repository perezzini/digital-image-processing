%Ejer04.m: filtrado pasa altos
clear all
close all

Resp=input('Nombre imagen: ','s');
if isempty(Resp)
    return
end
I=imread(Resp);

%%
Resp=input('Tama�o kernel [3]: ','s');
if isempty(Resp)
    Resp='3';
end
Tk=eval(Resp);

ker=fspecial('average',[Tk Tk]);    % es igual que fspecial('average',Tk)

uni = zeros([Tk Tk]);
uni(fix(Tk/2) + 1, fix(Tk/2) + 1) = 1; % kernel identidad

ker = uni - ker; % kernel pasa altos

Ipa=imfilter(I,ker);

figure,imshow([I Ipa]),title(sprintf('Kernel pasa altos %dx%d',Tk,Tk))

%% Filtro para enfatizar detalles/bordes (altas frecuencias)

Resp=input('Par�metro de �nfasis [2]: ', 's');
if isempty(Resp)
    Resp='2';
end
A=eval(Resp);

ker=fspecial('average',[Tk Tk]);    % es igual que fspecial('average',Tk)

uni = zeros([Tk Tk]);
uni(fix(Tk/2) + 1, fix(Tk/2) + 1) = A; % kernel

ker = uni - ker; % kernel high boost

Ihb=imfilter(I,ker);

figure,imshow([I Ihb]),title(sprintf('Kernel high boost %dx%d',Tk,Tk))