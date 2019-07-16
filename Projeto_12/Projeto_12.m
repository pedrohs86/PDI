clc;
clear all;

f = imread('RGB-color-cube.tif'); % Imagem original

hsi=rgb2hsi(f); % Transformação de RGB para HSI
imwrite(hsi ,'rgb2hsi_cube.tif','tif');

rgb=hsi2rgb(hsi); % Transformação de HSI para RGB
imwrite(rgb ,'hsi2rgb_cube.tif','tif');