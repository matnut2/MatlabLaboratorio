clear all;
clc;

% DATI 
f = @(x) 2*x + 1;
n = 1;
x = linspace(0, 5, 10);

coeff = polyfit(x, f(x), n+1);

x1 = linspace(0, 5, 50);
y1 = polyval(coeff, x1);

figure(1)
hold on
plot(x, f(x), "xk");
plot(x1, y1, "-b");
title("Verifica Interpolante");
legend("f(x)", "Interpolatore");