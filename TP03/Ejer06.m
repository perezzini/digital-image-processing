% Ejer06.m: filtros no linealesclear all
close all

Resp=input('Nombre imagen: ','s');
if isempty(Resp)
    return
end
I=imread(Resp);

Resp=input('Tama�o kernel [3]: ','s');
if isempty(Resp)
    Resp='3';
end
Tk=eval(Resp);

%% Filtro de mediana (filtro pasa bajos; no utiliza la funci�n de convoluci�n)
M = medfilt2(I, [Tk Tk]);

figure, imshow([I M]), title((sprintf('Mediana kernel %dx%d',Tk,Tk)))
% Luego, se le podr�a aplicar un filtro PA para realzar los bordes en caso
% de que la imagen quede muy borroneado