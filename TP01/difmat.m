function Y = difmat( X, dim )
%difmat(X)
%   Calcula la diferencia finita de las colúmnas ó filas de una matriz.
%   inputs
%       X: matriz
%       dim: selecciona la dimensión a diferenciar; es decir, filas o
%       colúmnas
%           dim == 1 -> filas
%           dim == 2 -> columnas
%   outputs
%       Y: matriz

[f, c] = size(X);

if dim == 1
    %% diferenciar filas

    %% preallocate Y
    Y = zeros(f, c-1);
    for k = 1:1:f
        Y(k, :) = difvector(X(k, :));
    end
else
    if dim == 2
        %% diferenciar columnas

        %% preallocate Y
        Y = zeros(f-1, c);
        for k = 1:1:c
            Y(:, k) = difvector(X(:, k));
        end
    end
end

% Otra forma sin utilizar difvector():
% [X(2:m,:)-X(1:m-1,:)]

end
