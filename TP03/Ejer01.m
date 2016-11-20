% Ejer01: generación de ruido
clear all
close all

Resp=input('Nombre imagen: ','s');
if isempty(Resp)
    return
end
I=imread(Resp);


%% gausiano o normal (con media = 0)
Resp=input('Desvío: ','s');
if isempty(Resp)
    return
end
sigma=eval(Resp);

% Ig=uint8(mat2gray(noise(I,'ag',sigma))*255);
% figure,imshow([I Ig])

Ig2=uint8(noise(I,'ag',sigma));
figure,imshow([I Ig2]),title('Ruido gausiano')

Resp=input('Nombre imagen con ruido gausiano: ','s');
if isempty(Resp)
    return
end
imwrite(Ig2,Resp,'tiff','Compression','none')

%% uniforme
Resp=input('Ruido uniforme (en %): ','s');
if isempty(Resp)
    return
end
nivel=eval(Resp);

Resp=input('Proporción de pixels (entre 0 y 1): ','s');
if isempty(Resp)
    return
end
prop=eval(Resp);

Iu=uint8(noise(I,'au',nivel,prop));
figure,imshow([I Iu]),title('Ruido uniforme')

Resp=input('Nombre imagen con ruido uniforme: ','s');
if isempty(Resp)
    return
end
imwrite(Iu,Resp,'tiff','Compression','none')

%% sal y pimienta
disp('Ruido sal y pimienta')
Resp=input('Proporción de pixels (entre 0 y 1): ','s');
if isempty(Resp)
    return
end
prop=eval(Resp);

Isp=imnoise(I,'salt & pepper',prop);
figure,imshow([I Isp]),title('Ruido s&p')

Resp=input('Nombre imagen con ruido s&p: ','s');
if isempty(Resp)
    return
end
imwrite(Isp,Resp,'tiff','Compression','none')

%% sal
% disp('Ruido sal')
% Resp=input('Proporción de pixels: ','s');
% if isempty(Resp)
%     return
% end
% prop=eval(Resp);
% 
% Ruido=ones(size(I),'uint8')*127;
% Ruido=imnoise(Ruido,'salt & pepper',prop);
% Is=I;
% Is(Ruido~=127)=255;
% 
% figure,imshow([I Is]),title('Ruido sal')




