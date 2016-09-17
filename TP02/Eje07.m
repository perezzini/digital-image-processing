% Ejer07: promediado de imágenes
clear all
close all

I00=imread('curv000.tif');
I=double(I00);          % buffer para acumular. Por qué en double?

%%
for k=1:7
    NomImag=sprintf('curv%03d.tif',k);
    I=I+double(imread(NomImag));
end
I08=uint8(I/8);


for k=8:15
    NomImag=sprintf('curv%03d.tif',k);
    I=I+double(imread(NomImag));
end
I16=uint8(I/16);


for k=16:31
    NomImag=sprintf('curv%03d.tif',k);
    I=I+double(imread(NomImag));
end
I32=uint8(I/32);

%%
figure,imshow([I00,I08;I16,I32])




