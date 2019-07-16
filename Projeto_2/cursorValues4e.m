function[r,c,v]=cursorValues4e(f)
% Função que retorna o valor do Pixel e a posição M,N em f onde o ocorre o click do mouse;
    imshow(f);
    [a,b] = ginput(1);
    c = round(a);
    r = round(b);
    v = pixVal4e(f,r,c);
    close;
end