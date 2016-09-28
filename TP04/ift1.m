function g = ift1( G )
%g = itf1( G )
%   Transformada inversa de Fourier 1D
%     G: vector de entrada
%     g: vector transformado

if ~isvector(G)
   g = 0;
   return
end

fila = false;
if isrow(G)
    fila = true;
    G = G.';
end

N = length(G);
n = 0:N-1;
k = n';

A = exp(1i*2*pi*(k*n)/N);

g = (A*G)/N;

if fila % si G es fila, g también (para que los dos estén en el mismo "sentido")
    g = g.';
end

end



