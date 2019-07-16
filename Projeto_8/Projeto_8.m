clc;
clear all;
f = imread('testpattern1024.tif');%%Leitura da imagem .tif;
w1 = ones(3,3); %% Cria��o da mascara 3x3
g1 = twodSFilter(f,w1); %%Execu��o da fun��o twodSFilter para a mascara 3x3

w2 = ones(11,11); %% Cria��o da mascara 11x11
g2 = twodSFilter(f,w2); %%Execu��o da fun��o twodSFilter para a mascara 11x11

w3 = ones(21,21); %% Cria��o da mascara 21x21
g3 = twodSFilter(f,w3); %%Execu��o da fun��o twodSFilter para a mascara 21x21

figure(1);
imshow(f); 
figure(2);
imshow(g1); 
figure(3);
imshow(g2); 
figure(4);
imshow(g3); 