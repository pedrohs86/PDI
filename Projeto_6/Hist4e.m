function [g]=Hist4e(f)
% A função Hist4e gera um vetor que armazena as reptições dos valores
% de 'f' sendo que 'f' tem que ser uma imagem de em escala de cinza de oito 
% bits por exemplo a quantida de vezes que o valor 253 aparece e na imagem f

a = zeros(1,256);
[M,N] = size(f);

for i = [1:M]
    for j =[1:N]
       a(f(i,j)+1) = a(f(i,j)+1) + 1;
    end
end

g = a;





end

