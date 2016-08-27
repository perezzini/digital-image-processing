function res = rotmat( A, index, fc, rot )
%rotmat(A, index, fc, rot)
%   Rota los elementos de una colúmna o de una fila de una matriz dada.
%   Toma cuatro argumentos:
%       A: matriz
%       index: índice de la fila/col que se quiere rotar
%       fc: indica si el índice es una fila o una col
%           fc == 1 -> fila
%           fc == 2 -> col
%       rot: valor de rotación a derecha
%   Se utiliza la función rotvector() como función base.

if fc == 1
    A(index, :) = rotvector(A(index, :), rot);
else
    if fc == 2
        A(:, index) = rotvector(A(:, index), rot);
    else
        error('Error. No definido'); %% Al parecer, no devuelve lo esperado. No sé porqué.
    end
end

res = A;

end

