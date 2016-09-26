function J = alfaRecortado( I, Tk, pAR )
%J = alfaRecortado( I, pAR )
%   Filtro alfa recortado
%     I: imagen original
%     Tk: tamaño del kernel como [Fk Ck]
%     pAR: parám. del filtro, donde 0 <= p <= fix(Nk/2)
%     J: imagen filtrada
%     Criterio de los bordes: no los analizamos; es decir, los "dejamos pasar"

I = double(I); % para que no "joda" el imtoolbox
J = I;

Nker = Tk(1)*Tk(2); % número de píxels del kernel

if (pAR < 0 || pAR > fix(Nker/2))
    error('Parámetro pAR inválido');
end

% Indices para calcular valor medio
imin = pAR + 1;
imax = Nker - pAR;

% Tamaños del kernel para lectura de la imagen
vf = fix(Tk(1)/2);
vc = fix(Tk(2)/2);

[Nfil, Ncol] = size(I);

% Mismo procedimiento para todos los demas filtros, sólo cambia (1) y (2)
for col = vc+1:Ncol-vc
    for fil = vf+1:Nfil-vf
        X = I(fil-vf:fil+vf, col-vc:col+vc); % extrae área de I (utilizando el kernel)
        V = sort(X(:)); % pixels ordenados en forma de col (1)
        J(fil, col) = mean(V(imin:imax)); % calcula promedio (2)
    end
end