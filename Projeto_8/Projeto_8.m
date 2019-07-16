clc;
clear all;
f = imread('testpattern1024.tif');%%Leitura da imagem .tif;
w1 = ones(3,3); %% Criação da mascara 3x3
g1 = twodSFilter(f,w1); %%Execução da função twodSFilter para a mascara 3x3

w2 = ones(11,11); %% Criação da mascara 11x11
g2 = twodSFilter(f,w2); %%Execução da função twodSFilter para a mascara 11x11

w3 = ones(21,21); %% Criação da mascara 21x21
g3 = twodSFilter(f,w3); %%Execução da função twodSFilter para a mascara 21x21

figure(1);
imshow(f); 
figure(2);
imshow(g1); 
figure(3);
imshow(g2); 
figure(4);
imshow(g3); 