close all;
Img=imread('C:\Users\ccosta\Google Drive\disciplina_PDI\gonzalez\DIPUM\dipum_images_ch04\Fig0409(a)(bld).tif');
figure;
imshow(Img);
S=size(Img);
M=2*S(1,1);
N=2*S(1,2);
Do=0.05*M;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%computa as coordenadas para utiliza��o em filtros centradas em (M/2,N/2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%fixa vetores de coordenadas
%u=[0 1 2 3 4 5 .... (M-1)]
u=0:(M-1);
%v=[0 1 2 3 4 5 .... (N-1)]
v=0:(N-1);

%centraliza os vetores de coordenadas
%Se M fosse igual a 11 a pr�xima linha do programa faria o seguinte:
%u=[-5 -4 -3 -2 -1 0 1 2 3 4 5]
u=u-M/2;
%o mesmo com v se N fosse igual a 11:
%v=[-5 -4 -3 -2 -1 0 1 2 3 4 5]
v=v-N/2;

%c�lculo do array meshgrid
%a fun�ao [X,Y]=Meshgrid(x,y)
% produz uma matriz X que tem um n�mero de linhas igual a dimens�o do vetor y e todas elas repetem o vetor x.
% produz uma matrix Y que tem um n�mero de colunas igual a dimens�o do vetor x e todas elas repetem o vetor y.

%No nosso caso: cria matrizes V,U onde V conter� N colunas do vetor u
% e a U conter� M linhas do vetor v
%U = [ v;v;v;v;v...v] M-1 linhas e N-1 colunas]
%V = [ u u u u u ...u] N-1 colunas e M-1 linhas]

[U,V]=meshgrid(v,u);
U;
V;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calcula o filtro Gaussiano
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Calcula as distancias D(U,V)
D= sqrt(U.^2 + V.^2);

% Detemina�ao do filtro H(u,v)
H= exp(-(D.^2)./(2*(Do^2)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Aplica��o do Filtro Gaussiano
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Pr�-processamento da imagem (padding + shifting da imagem original).
Img1=zeros(M,N);

for i=1:S(1,1)
    for j=1:S(1,2)
        Img1(i,j)=Img(i,j);
    end
end

%multiplicando por (-1)^(i+j)
for i=1:S(1,1)
    for j=1:S(1,2)
        k=i+j;
        Img1(i,j)=Img1(i,j)*((-1)^k);
    end
end



%Obten��o da FFT da imagem de entrada acrescida de zeros.
F = fft2(Img1);

%Realiza a filtragem e calcula a transformada inversa.
%Necess�rio pegar apenas a parte real (m�todos matem�ticos
%h� nos termos gera parte complexa).
g = real(ifft2(H.*F));
H1=1-H;
g1 = real(ifft2(H1.*F));


%P�s-Processamento 
%Crop para o tamanho original da imagem.
Img2 = g(1:S(1,1),1:S(1,2));
Img3 = g1(1:S(1,1),1:S(1,2));

%multiplica��o por (-1)^(i+j) para compensar o deslocamento do espectro 
%realizado no in�cio da opera��o.

for i=1:S(1,1)
    for j=1:S(1,2)
        k=i+j;
        Img2(i,j)=Img2(i,j)*((-1)^k);
    end
end

for i=1:S(1,1)
    for j=1:S(1,2)
        k=i+j;
        Img3(i,j)=Img3(i,j)*((-1)^k);
    end
end

Img2=mat2gray(Img2);
figure;
imshow(Img2);
title(['Imagem passa baixa Do=',num2str(Do)]);
Img3=mat2gray(Img3);
figure
imshow(Img3);
title(['Imagem passa alta Do=',num2str(Do)]);

