function J = alfaRecortado( I, Tk, pAR )
%J = alfaRecortado( I, pAR )
%   Filtro alfa recortado
%     I: imagen original
%     Tk: tama�o del kernel como [Fk Ck]
%     pAR: par�m. del filtro, donde 0 <= p <= fix(Nk/2)
%     J: imagen filtrada
%     Criterio de los bordes: no los analizamos; es decir, los "dejamos pasar"

I = double(I); % para que no "joda" el imtoolbox
J = I;

Nker = Tk(1)*Tk(2); % n�mero de p�xels del kernel

if (pAR < 0 || pAR > fix(Nker/2))
    error('Par�metro pAR inv�lido');
end

% Indices para calcular valor medio
imin = pAR + 1;
imax = Nker - pAR;

% Tama�os del kernel para lectura de la imagen
vf = fix(Tk(1)/2);
vc = fix(Tk(2)/2);

[Nfil, Ncol] = size(I);

% Mismo procedimiento para todos los demas filtros, s�lo cambia (1) y (2)
for col = vc+1:Ncol-vc
    for fil = vf+1:Nfil-vf
        X = I(fil-vf:fil+vf, col-vc:col+vc); % extrae �rea de I (utilizando el kernel)
        V = sort(X(:)); % pixels ordenados en forma de col (1)
        J(fil, col) = mean(V(imin:imax)); % calcula promedio (2)
    end
end