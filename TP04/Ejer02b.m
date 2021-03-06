% Ejer02b: uso de fft2() en im�genes
clear all
close all

Resp=input('Nombre imagen: ','s');
if isempty(Resp)
    return
end
I=imread(Resp);
figure, imshow(I), title(Resp)
%%
I=double(I);
If=fftshift(fft2(I));       % transformada de I
figure,imshow(mat2gray(abs(If))),title('fft')
figure,imshow(mat2gray(angle(If))),title('Fase de fft')

If2=fftshift(fft2(I-mean2(I))); % fft sin valor medio
figure,imshow(mat2gray(abs(If2))),title('fft sin valor medio')

MIf=abs(If);
MIf=log(MIf+1);
figure,imshow(mat2gray(MIf)),title('log de fft')
% Supondremos que las im�genes tienen un s�lo per�odo.