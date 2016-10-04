% Ejer02b: uso de fft2() en imágenes
clear all
close all

Resp=input('Nombre imagen: ','s');
if isempty(Resp)
    return
end
I=imread(Resp);
%%
% figure, imshow(I), title(Resp)

I = double(I);
% I = double(I)-mean2(I);
If=fftshift(fft2(I));       % transformada de I
figure,imshow(mat2gray(abs(If))), title('fft')

If2=fftshift(fft2(I - mean2(I))); % fft sin valor medio
figure,imshow(mat2gray(abs(If2))), title('fft sin valor medio')

MIf = abs(If);
MIf = log(MIf + 1);
figure,imshow(mat2gray(abs(MIf))), title('log de fft')

% Supondremos que las imágenes miden 1.