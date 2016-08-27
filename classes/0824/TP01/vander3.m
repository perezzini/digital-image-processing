%vander3

clear all

x = (1:6).';
m = 7;

V = repmat(x, 1, m+1).^repmat([m: -1: 0], length(x), 1);
