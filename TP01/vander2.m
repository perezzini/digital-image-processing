%vander2.m

clear all

x = (1:6).';
m = 7;
V = ones(length(x), m + 1); %% reservo espacio de solución

for k = 1:m
    V(:, k) = x.^(m + 1 - k); %% se crean las colúmnas
end