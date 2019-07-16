function g=imagePad4e(f,r,c,varargin)
%Função adicionar o preenchimento na imagem de acordo com o numero de
%linhas 'r' e colunas 'c' podendo ser por zeros ou replicados

%Variaveis Auxiliares
[M,N] = size(f);
if(size(varargin)==0) %%Modo default é o modo 'zeros'
    A = zeros(M,c);
    B = zeros(r,N+2*c);
    g = [B;A,f,A;B];
else
    if(strcmp(varargin{1},'zeros'))% Modo 'zeros'
         A = zeros(M,c);
         B = zeros(r,N+2*c);
         g = [B;A,f,A;B];
    else
        if(strcmp(varargin{1},'replicate'))% Modo replicate
            A = f(1:M,1);
            B = f(1,1:N);
            for i =1:(c-1)
                A = [A,f(1:M,1)];
            end
            for i = 1:(r-1)
                B = [B;f(1,1:N)];
            end
            for i =1:c
                L1 = B(1:r,N);
                L2 = B(1:r,1);
                B = [B,L1];
                B = [L2,B];
            end
            g = [B;A,f,A;B];
        else
            disp('Mode invalido'); %Entrada invalida
            g = 0;
        end
    end
end
    
end