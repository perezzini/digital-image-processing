function y=convolucion1(x,h)
%y=convolucion1(x,h)
% Calcula convolución discreta 1D
%   x,h: señales originales
%   y: resultado de la convolución

if ~isvector(x)
    error('x debe ser vector')
end
fila=false;
if isrow(x)
    fila=true;
    x=x.';
end

if ~isvector(h)
    error('h debe ser vector')
end
if isrow(h)
    h=h.';
end

P=length(x);
Q=length(h);
N=P+Q-1;        % tamaño de la convolución

x=[x;zeros(N-P,1)];     % señales extendidas
h=[h;zeros(N-Q,1)];     % al tamaño final de la convolución

T=toeplitz(x,[x(1) zeros(1,N-1)]);

y=T*h;          % convolución discreta

if fila
    y=y.';
end


end