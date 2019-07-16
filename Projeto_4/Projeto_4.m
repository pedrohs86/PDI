f = imread('girl.tif');%%Leitura da imagem .tif;

g = imagescaling(f,0.5,0.5);
figure(1)
imshow(f,[]); %%Imagem original
figure(2)
imshow(g,[]); %%Imagem escalonada
imwrite(g,'girl_half.tif','tif'); %Salva a imagem Girl.tif escalonada pela metade;