clc;
clear all;

% DATI
f = @(x) exp(x) - 2 + x;
x = linspace(0, 1, 10000);
toll = 10^(-8);
a = 0;
b = 1;
sol = 0.4428544010023885;

% PUNTO 1
figure(1)
title("f(x)")
plot(f(x))

% PUNTO 2
fprintf("%f\n", f(a)*f(b));

% PUNTO 3
[x, xall, iter] = bisezione(f, a, b, toll, 1000);

% PUNTO 4
err = abs(sol - xall)/abs(sol);
figure(2)
semilogy(err);
figure(3)
plot(err);