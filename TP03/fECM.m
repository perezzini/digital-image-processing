function J = fECM( I, Tk, sRuido )
%Filtro adaptativo, de error cuadr�tico medio
% J = fECM( I, Tk, sRuido )
%   I: imagen original
%     Tk: tama�o del kernel
%     sRuido: desv�o del ruido

I = double(I); % para que no "joda" el imtoolbox
J = I;

% Tama�os del kernel para lectura de la imagen
vf = fix(Tk(1)/2);
vc = fix(Tk(2)/2);

[Nfil, Ncol] = size(I);

% Mismo procedimiento para todos los demas filtros, s�lo cambia (1) y (2)
for col = vc+1:Ncol-vc
    for fil = vf+1:Nfil-vf
        X = I(fil-vf:fil+vf, col-vc:col+vc); % extrae �rea de I (utilizando el kernel)
        Xmedio = mean2(X);
        Xdesv = std2(X);
        
        if Xdesv < eps % evita divisi�n por cero
            Xdesv = eps;
        end
        
        J(fil, col) = (1 - (sRuido/Xdesv)^2)*I(fil, col) + ...
            (sRuido/Xdesv)^2*Xmedio; % Imagen real estimada (f_est). Donde I = g (v�ase teor�a)
    end
end

end
