%Vander1.m
clear all

x = (1:6).'; %% x = (1:6)';
m = 7;
V = [];

for k = m:-1:0
    V = [V, x.^k];
end