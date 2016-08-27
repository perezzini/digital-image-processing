function [ output_args ] = rotvector( x, n )
%rotvector(x, n)
%   Rota elementos de vector.
%   x: vector a rotar
%   n: valor de rotación
%   Si n >= 0: rota hacia derecha/abajo
%   en caso contrario: rota hacia izquierda/arriba
%   res: vector rotado

n = mod(n, length(x));

% y = [x(end - n + 1 : end), x(1 : end - n)]; solo vale para vector fila
% y = [x(end - n + 1 : end); x(1 : end - n)]; solo vale para vector columna

y = x([end-n+1:end, 1:end-n]) % sin importar si es vector columna o fila


%rotmatriz(A,n)
%n(1): rotar vertical
%n(2): rotar horizontal

end

