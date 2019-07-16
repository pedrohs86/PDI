clc;
clear all;

f = imread('sunflower.tif'); % Imagem original

cmy=colorSpaceConv(f,"rgb2cmy"); % Transforma��o de RGB para CMY
imwrite(cmy ,'rgb2cmy_sun.tif','tif');

rgb1=colorSpaceConv(cmy,"cmy2rgb"); % Transforma��o de CMY para RGB
imwrite(rgb1 ,'cmy2rgb_sun.tif','tif');

cmyk=colorSpaceConv(rgb1,"rgb2cmyk"); % Transforma��o de RGB para CMYK
imwrite(cmyk ,'rgb2cmyk_sun.tif','tif');

rgb2 = colorSpaceConv(cmyk,"cmyk2rgb"); % Transforma��o de CMYK para RGB
imwrite(rgb2 ,'cmyk2rgb_sun.tif','tif');
