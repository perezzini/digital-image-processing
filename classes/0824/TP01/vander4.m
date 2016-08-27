%vander4

clear all

x = (1:6).';
m = 7;

V = ones(length(x), m+1);
% A = cumprod(repmat(x, 1, m), 2);
% V(:, 1:end-1) = A(:, end:-1:1);

V(:, 2: end) = cumprod(repmat(x, 1, m), 2);
V = V(:, end: -1: 1);