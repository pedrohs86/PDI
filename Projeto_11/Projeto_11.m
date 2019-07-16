clc;
clear all;

f = imread('sunflower.tif'); % Imagem original

cmy=colorSpaceConv(f,"rgb2cmy"); % Transformação de RGB para CMY
imwrite(cmy ,'rgb2cmy_sun.tif','tif');

rgb1=colorSpaceConv(cmy,"cmy2rgb"); % Transformação de CMY para RGB
imwrite(rgb1 ,'cmy2rgb_sun.tif','tif');

cmyk=colorSpaceConv(rgb1,"rgb2cmyk"); % Transformação de RGB para CMYK
imwrite(cmyk ,'rgb2cmyk_sun.tif','tif');

rgb2 = colorSpaceConv(cmyk,"cmyk2rgb"); % Transformação de CMYK para RGB
imwrite(rgb2 ,'cmyk2rgb_sun.tif','tif');
