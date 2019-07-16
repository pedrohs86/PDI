f = imread('cktboard_200dpi_gl.jpg'); %%Leitura da imagem .jpg;
[M,N] = size(f); %%Pegar o tamanho de linhas e colunas;
A = N*M; %%Tamanho em Pixels da imagem;
Valor_Md_Cinza = sum(sum(f))/A; %%Valor médio das intensidades do nível de cinza;
K = imfinfo('cktboard_200dpi_gl.jpg');
Valor_bits_pixels = K.BitDepth; %%Valor do número de bits utilizado para armazenar cada pixel;
image_bytes = A*Valor_bits_pixels/8; %%Tamanho da imagem em Bytes;
c_file = K.FileSize; %%Tamanho da imagem em Bytes com compressão;
Compression_Ratio = image_bytes/c_file; %%Taxa de Compressão
imshow(f); 
imwrite(f,'Projeto1.tif','tif');%%Salvar a imagem em outro formato;