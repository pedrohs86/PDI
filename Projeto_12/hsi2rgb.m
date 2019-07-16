function g=hsi2rgb(f)
% Conversao modelo HSI para RGB

f=double(f)./max(max(f));

H = f(:,:,1);
S = f(:,:,2);
I = f(:,:,3);

H = 2*pi*H;

r = ones(size(H));
g = ones(size(H));
b = ones(size(H));


k=find(H<=(2*pi/3));
b(k) = (1/3)*(1-S(k));
r(k) = (1/3)*(1+ ((S(k).*cos(H(k)))./cos((pi/3)-H(k))) );
g(k) = 1-(r(k)+b(k));

k=find( (H>(2*pi/3)) & (H<=(4*pi/3)) );
H(k) = H(k)-(2*pi/3);
r(k) = (1./3)*(1-S(k));
g(k) = (1./3)*(1+ ((S(k).*cos(H(k)))./cos((pi/3)-H(k))) );
b(k) = 1-(r(k)+g(k));

k=find( (H>(4*pi/3)) & (H<=(2*pi)) );
H(k) = H(k)-(4*pi/3);
g(k) = (1./3)*(1-S(k));
b(k) = (1./3)*(1+ ((S(k).*cos(H(k)))./cos((pi/3)-H(k))) );
r(k) = 1-(g(k)+b(k));

R=3*I.*r;
G=3*I.*g;
B=3*I.*b;

R = R*255;
G = G*255;
B = B*255;


RGB(:,:,1)=R;
RGB(:,:,2)=G;
RGB(:,:,3)=B;

g = uint8(RGB); 

return;