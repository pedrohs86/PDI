function g=rgb2hsi(f)
% Conversao modelo RGB para HSI


f=double(f)/255;

R = f(:,:,1); 
G = f(:,:,2);
B = f(:,:,3);

%Matriz intesidade
I = (R+G+B)/3;  

%Matriz Saturação
S = zeros(size(I));
k = find(I>0);
S(k) = 1 - ( 3.*min(min(R(k),G(k)),B(k))./(R(k)+G(k)+B(k)));

%Matriz HUE
H = zeros(size(I));
k = find(I>0);
H(k) = acos( (1/2).*((R(k)-G(k))+(R(k)-B(k))) ./ sqrt(((R(k)-G(k)).^2)+((R(k)-B(k)).*(G(k)-B(k)))) );  % calculo da matiz ("hue")
k1 = find(I);
k2 = find( (B(k1)./I(k1)) > (G(k1)./I(k1)) );
temp = H;
temp(k2) = (2*pi)-H(k2);
H = temp;

% Normalização
H = H./max(max(H));
S = S./max(max(S));
I = I./max(max(S));

HSI=zeros(size(f));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;

g = HSI; 

return;