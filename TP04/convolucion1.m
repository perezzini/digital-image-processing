function y=convolucion1(x,h)
%y=convolucion1(x,h)
% Calcula convoluci�n discreta 1D
%   x,h: se�ales originales
%   y: resultado de la convoluci�n

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
N=P+Q-1;        % tama�o de la convoluci�n

x=[x;zeros(N-P,1)];     % se�ales extendidas
h=[h;zeros(N-Q,1)];     % al tama�o final de la convoluci�n

T=toeplitz(x,[x(1) zeros(1,N-1)]);

y=T*h;          % convoluci�n discreta

if fila
    y=y.';
end


end