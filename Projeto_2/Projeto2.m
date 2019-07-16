f = imread('girl.tif'); % Leitura da imagem .tif;
[M,N] = size(f); % Pega o tamanho de linhas e colunas;
PV_Origin = pixVal4e(f,1,1); % Obtem o valor do pixel da origem da imagem;
PV_Middle = pixVal4e(f,floor(M/2),floor(N/2)); % Obtem o valor do pixel do centro da imagem;
[r,c,v]=cursorValues4e(f); % Obtem a posição em M,N e o valor do pixel onde ocorreu o click do mouse;