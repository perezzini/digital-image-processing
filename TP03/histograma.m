function h = histograma( I )
%h = histograma(I)
%   Calcula histograma de imagen uint8
%   I: imagen de entrada en uint8
%   h = histograma normalizado

h = zeros(1, 256);   % Inicializa histograma

% histograma sin normalizar
for k = 0:255
    h(k+1) = sum(I(:) == k);
end

% histograma normalizado
h = h/numel(I); % numel(I) = prod(size(I))

end
