function g=twodSFilter(f,w)
%Função que filtrata uma imagem f utilizando a mascara w utilizando de
%preencimento por replicação e filtragem por média.

%Variaveis Auxiliares
[M,N] = size(f);
[Mw,Nw] = size(w);
A = f(1:M,1);
B = f(1,1:N);

%Padding
for i =1:(Mw-3)
    A = [A,f(1:M,1)];
end

for i = 1:(Nw-3)
    B = [B;f(1,1:N)];
end

for i =1:(Mw-2)
    L1 = B(1:(Nw-2),N);
    L2 = B(1:(Nw-2),1);
    B = [B,L1];
    B = [L2,B];
end

%Variaveis Auxiliares
P = [B;A,f,A;B];
P = double(P);
P = P/255;
K = zeros(M,N);

%%Filtragem da imagem
for i = 1:M
    for j = 1:N
        for s = 1:Mw
            for t =1:Nw
                K(i,j)=w(s,t)*P((i+s-1),(j+t-1))+K(i,j);
            end
        end
        K(i,j)=K(i,j)/(Mw*Nw);
    end
end

g = uint8(K*255);

end