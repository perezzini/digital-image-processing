%vander2.m

clear all

x = (1:6).';
m = 7;
V = ones(length(x), m + 1); %% reservo espacio de soluci�n

for k = 1:m
    V(:, k) = x.^(m + 1 - k); %% se crean las col�mnas
end