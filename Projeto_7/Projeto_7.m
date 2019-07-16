clc;
clear all;
f = imread('testpattern1024.tif');%%Leitura da imagem .tif;

g1 = imagePad4e(f,100,1,'replicate'); %%Execu��o da fun��o imagePad4e
g2 = imagePad4e(f,1,10,'zeros'); %%Execu��o da fun��o imagePad4e

figure(1);
imshow(g1); 

figure(2);
imshow(g2);