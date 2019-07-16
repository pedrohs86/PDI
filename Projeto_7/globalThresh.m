function [g] = globalThresh(f,varargin)
[M,N] = size(f);
T1=sum(sum(f))/(M*N);
T2=0;
A = 0;
B = 0;
q1 = 1;
q2 = 1;

if(size(varargin)==0)
    detT = 0.01;
else
    detT = varargin{1};
end

while T1-T2>=detT

    for i =1:M
        for j =1:N
            if f<=T1
                A = A + f(i,j);
                q1 = q1 + 1;
            else
                B = B + f(i,j);
                q2 = q2 + 1;
            end
        end   
    end

    T1 = T2
    T2 = A/q1 + B/q2
end
g = imbinarize(f,T1);

end