function E = calerror( t, h )
%E = calerror( t, h )
%   Calcula error de clasificación para el nivel de gris t
%     t: nivel de gris
%     h: histograma de la imagen

if iscolumn(h) % pasa h a vector fila
    h = h';
end

P1 = sum(h(1:t+1));

if P1 > 0
    m1 = sum((0:t).*h(1:t+1))/P1;
    s1 = sum(h(1:t+1).*(((0:t)-m1).^2))/P1;
    if s1 > 0
        s1 = sqrt(s1);
    else
        E = NaN;
        return
    end
else
    E = NaN;
    return
end

P2 = sum(h(t+2:end));

if P2 > 0
    m2 = sum((t+1:255).*h(t+2:end))/P2;
    s2 = sum(h(t+2:end).*(((t+1:255)-m2).^2))/P2;
    if s2 > 0
        s2 = sqrt(s2);
    else
        E = NaN;
        return
    end
else
    E = NaN;
    return
end

% Sabemos que P1, P2, s1 y s2 son positivos

E = 1 + 2*(P1*log(s1) + P2*log(s2)) - 2*(P1*log(P1) + P2*log(P2));

end

