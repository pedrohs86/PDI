f = imread('drip-bottle-256.tif'); %%Leitura da imagem .jpg;
g1 = floor(f/2);%%Redução do número de intensidades da imagem para 128
g2 = floor(g1/2); %%Redução do número de intensidades da imagem para 64
g3 = floor(g2/2); %%Redução do número de intensidades da imagem para 32
g4 = floor(g3/2); %%Redução do número de intensidades da imagem para 16
g5 = floor(g4/2); %%Redução do número de intensidades da imagem para 8
g6 = floor(g5/2); %%Redução do número de intensidades da imagem para 4
g7 = floor(g6/2); %%Redução do número de intensidades da imagem para 2

figure(1)
s(1) = subplot(1,2,1);
imshow(f,[]); %%Imagem com intensidade de 256
s(2) = subplot(1,2,2);
imshow(g1,[]); %%Imagem com intensidade de 128
title(s(1),'Imagem com intensidade de 256')
title(s(2),'Imagem com intensidade de 128')

figure(2)
s(1) = subplot(1,2,1);
imshow(g2,[]); %%Imagem com intensidade de 64
s(2) = subplot(1,2,2);
imshow(g3,[]); %%Imagem com intensidade de 32
title(s(1),'Imagem com intensidade de 64')
title(s(2),'Imagem com intensidade de 32')

figure(3)
s(1) = subplot(1,2,1);
imshow(g4,[]); %%Imagem com intensidade de 16
s(2) = subplot(1,2,2);
imshow(g5,[]); %%Imagem com intensidade de 8
title(s(1),'Imagem com intensidade de 16')
title(s(2),'Imagem com intensidade de 8')

figure(4)
s(1) = subplot(1,2,1);
imshow(g6,[]); %%Imagem com intensidade de 4
s(2) = subplot(1,2,2);
imshow(g7,[]); %%Imagem com intensidade de 2
title(s(1),'Imagem com intensidade de 4')
title(s(2),'Imagem com intensidade de 2')
