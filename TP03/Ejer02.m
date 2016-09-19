% Ejer02: filtrado para suavizar
clear all
close all

Resp=input('Nombre imagen: ','s');
if isempty(Resp)
    return
end
I=imread(Resp);
% ker=ones(3)/9;

%%
% Ic=uint8(conv2(double(I),ker,'same'));
% 
% figure,imshow([I Ic])
% 
% figure,plot(0:255,I(127,:),0:255,Ic(127,:)),grid on
% legend('Original','conv2')


%%
ker=fspecial('average',3);
If=imfilter(I,ker);

figure,imshow([I If])








