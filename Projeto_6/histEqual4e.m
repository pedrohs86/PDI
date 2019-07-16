function [g]=histEqual4e(f)
%Fun��o que faz a equaliza��o do histograma de f e gera uma imagem equalizada g

%Variaveis Auxiliares
[M,N] = size(f); 
V = Hist4e(f); %Reutiliza a fun��o desenvolvida no projeto anterior
V = V/(M*N);
R = zeros(1,256);
A = uint8(zeros([M N]));

%Desenvolvimento da equaliza��o global da imagem
for k =[1:256]
    for j = [1:k]
        R(k) = V(j)+R(k);
    end
    R(k)=ceil(255*R(k));
end

%Nova imagem equalizada
for i = 1:M
    for j = 1:N
        A(i,j) = R(f(i,j)+1);
    end
end

g = A;
end
