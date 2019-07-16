clc;
clear all;
f1 = imread('spillway-dark.tif');%%Leitura da imagem .tif;
f2 = imread('hidden-horse.tif');%%Leitura da imagem .tif;

g1 = histEqual4e(f1); %%Execu��o da fun��o histEqual4e
g2 = histEqual4e(f2); %%Execu��o da fun��o histEqual4e

figure(1);
imshow(g1); 
figure(2);
imshow(g2);