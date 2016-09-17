% Eje06: resta de imágenes
clear all
close all

I0=imread('t000.tif');
I1=imread('t001.tif');

Id=imabsdiff(I0,I1);

figure,imshow(Id,[])