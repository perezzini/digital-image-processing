function ve=cceros(v,N)
% Completa con ceros a izquierda y derecha el vector de entrada
% ve=cceros(v)
%   v: vector de P componentes
%   ve: vector extendido de N componentes

if ~isvector(v)     % solo para vectores
    ve=0;
    return
end

fil=size(v,1);  % cantidad de filas de v
if fil==1       % v es vector fila
    v=v.';      % convierte en columna
end

%% Determina longitud inicial de v y arma ve
P=length(v);
if N<=P              % solo para agrandar vectores
    ve=-1;
    return
end

ve=v;           % inicializa ve
ve(N)=0;        % cambia tamaño y agrega ceros a ve

%% Centra valores de v
Q=N-P;          % cantidad de ceros agregados
Q2=fix(Q/2);

if 2*Q2==Q      % Q es par
    ve=circshift(ve,Q2);
else
    ve=circshift(ve,Q2+1);
end

if fil==1       % v es vector fila
    ve=ve.';    % convierte ve en fila
end

