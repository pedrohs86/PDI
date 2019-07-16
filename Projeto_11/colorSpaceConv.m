function [g]=colorSpaceConv(f, method)

switch method
    case "rgb2cmy"
        f=double(f)/255;
        g=uint8((1-f)*255);
    case "cmy2rgb"
        f=double(f)/255;
        g=uint8((1-f)*255);
    case "rgb2cmyk"
        f=double(f)/255;
        cmy=uint8((1-f)*255);
        cmy=double(cmy)/255;
        K = min(min(cmy(:,:,1),cmy(:,:,2)),cmy(:,:,3));
        C = (cmy(:,:,1) - K)./(1-K);
        M = (cmy(:,:,2) - K)./(1-K);
        Y = (cmy(:,:,3) - K)./(1-K);
        aux(:,:,1) = C;
        aux(:,:,2) = M;
        aux(:,:,3) = Y;
        aux(:,:,4) = K;
        g = uint8(aux*255);
    case "cmyk2rgb"
        f=double(f)/255;
        C = (f(:,:,1).*(1-f(:,:,4)))+ f(:,:,4);
        M = (f(:,:,2).*(1-f(:,:,4)))+ f(:,:,4);
        Y = (f(:,:,3).*(1-f(:,:,4)))+ f(:,:,4);
        aux(:,:,1) = C;
        aux(:,:,2) = M;
        aux(:,:,3) = Y;
        g = uint8((1-aux)*255);
    otherwise
        disp('metodo invalido');
end
end