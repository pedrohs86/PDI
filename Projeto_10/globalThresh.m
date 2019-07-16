function [g] = globalThresh(f,varargin)
[M,N] = size(f);

x = double(f);
T1=sum(sum(x))/(M*N);


if(size(varargin)==0)
    detT = 0.01;
else
    detT = varargin{1};
end


G1 = 0;
G2 = 0;
q1 = 0;
q2 = 0;

for i =1:M
    for j =1:N
        if x(i,j)<=T1
            G1 = G1 + x(i,j);
            q1 = q1 + 1;
        else
            G2 = G2 + x(i,j);
            q2 = q2 + 1;
        end
    end   
end

if(q1==0)
    q1 = 1;
else
    if(q2==0)
        q2=1;
    end
end
    T2 = (G1/q1 + G2/q2)/2;
while (T2/255)-(T1/255)>detT
T1 = T2;
G1 = 0;
G2 = 0;
q1 = 0;
q2 = 0;

for i =1:M
    for j =1:N
        if x(i,j)<=T1
            G1 = G1 + x(i,j);
            q1 = q1 + 1;
        else
            G2 = G2 + x(i,j);
            q2 = q2 + 1;
        end
    end   
end

if(q1==0)
    q1 = 1;
else
    if(q2==0)
        q2=1;
    end
end
    
    T2 = (G1/q1 + G2/q2)/2;
end
T3 = (T2/255);
g = imbinarize(f,T3);

end