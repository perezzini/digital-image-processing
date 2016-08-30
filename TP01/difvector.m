function y = difvector( x )
%difvector(x)
%   La diferencia finita de Y entre los componentes de un vector X 
%   se define como Yn = Xn+1 – Xn donde n = 1, ..., N-1.
%   Input:
%       X: vector de N componentes
%   Output:
%       Y: vector diferencia finita de X. Y posee N-1 componentes

%l = length(x);

% La forma más elemental:
% for k = 1:1:l-1
%     y(k) = x(k+1) - x(k);

a = x(2:end);
b = x(1:end-1);

y = a-b;

% Otra forma:
% y = rotvector(x, -1)-x;
% y(end) = [];

end