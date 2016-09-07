function J = ecualizar( I )
%J = ecualizar( I )
%   Ecualiza la imagen de entrada en UINT8

% histograma normalizado; devuelve un vector col
h = imhist(I)/numel(I);

% suma acumulada. LUT de ecualizaci�n
g = uint8(cumsum(h)*255); % se multiplica por 255 porque el resultado de cumsum() est� entre 0 y 1

J = aplicaLUT(I, g);


end

