A=imread('polymercell.tif'); 

C(A<194)=0;

s=strel('disk',3,0);%Elemento estruturante

D=im2bw(C);%Imagem binaria

F=imerode(D,s);


figure,imshow(A);title('Imagem Original');

figure,imshow(D);title('Imagem Binaria');

figure,imshow(D-F);title('Imagem com a extração de bordas');