function J = aplicaLUT( I, T )
%J = aplicaLUT( I, T )
%   Transforma la intensidad en I en base a T
%       I: imagen original
%       T: vector de transformación
%       J: imagen procesada

J = I;

for k = 0:255
   J(I == k) = T(k+1);
end

end

