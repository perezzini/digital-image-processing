function G = tf1( g )
%G = tf1( g )
%   Transformada de Fourier 1D
%     g: vector de entrada
%     G: vector transformado

if ~isvector(g)
   G = 0;
   return
end

fila = false;
if isrow(g)
    fila = true;
    g = g.';
end

N = length(g);
k = 0:N-1;
n = k';

A = exp(-1i*2*pi*(n*k)/N);

G = A*g;

if fila % si g es fila, G también (para que los dos estén en el mismo "sentido")
    G = G.';
end

end

