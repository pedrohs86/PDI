function [g]=imageHist4e(f,varargin)
% A função imageHist4e gera o histograma da imagem de entrada 'f' sendo que
% é normalizado para mode = 'n' e não normalizado com o mode = 'u'. Tem com
% default o modo normalizado.

[M,N] = size(f);
a = [0:255];

if(size(varargin)==0)
    b = Hist4e(f);
    c = b/(M*N);
    stem(a,c,'LineWidth',2,'Marker','.','MarkerSize',1);
    g = c;
else
    if(varargin{1}=='u')
       b = Hist4e(f);
       stem(a,b,'LineWidth',2,'Marker','.','MarkerSize',1);
       g = b;
    else
        if(varargin{1}=='n')
            b = Hist4e(f);
            c = b/(M*N);
            stem(a,c,'LineWidth',2,'Marker','.','MarkerSize',1);
            g = c;
        else
            disp('Mode invalido');
            g = 0;
        end
    end
end
end