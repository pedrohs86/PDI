function [g]=imagescaling(f,cx,cy)
% A funcao imagescaling aumenta ou diminui o numero de linhas e colunas da imagem f diretamente proporcional aos valores de cx e cy respectivamente.

[M,N] = size(f); %Determina o tamanho da imagem de entrada.
Mg = round(M*cx); %Determina o tamanho da nova imagem de acordo com os valores de entrada
Ng = round(N*cy);

c = zeros(Mg,Ng); %Matrix auxilia
c = im2uint8(c);

for i = [1:Mg]
    for j =[1:Ng]
        %Calculo do mapeamento de g em f
        X1 = M - (M-1)*(Mg-i)/(Mg-1); 
        Y1 = N - (N-1)*(Ng-j)/(Ng-1);
        
        %Determina os vizinhos mais proximos de X1 e Y1
        X2 = floor(X1); 
        X3 = ceil(X1);
   
        Y2 = floor(Y1); 
        Y3 = ceil(Y1);
        
        % Valores de "u" e "lambda".
        mi = X1-X2;
        lam = Y1-Y2;
        
        %Calculo dos valrores da interpolação bilinear
        c(i,j)= round(lam*(mi*f(X3,Y3)+(1-mi)*f(X3,Y2))+(1-lam)*(mi*f(X2,Y3)+(1-mi)*f(X2,Y2)));
    end
end

g = c;
end