clc;
clear all;

f = imread('rice-shaded.tif');
figure,histogram(f)
th = ~globalThresh(f,-0.00001);
figure,imshowpair(f,th,'montage');
