clear all;
clc;

% DATI
f = @(x) sin(x) + x - 1;
x = linspace(0,10,100); 
toll = 10^(-8);
sol = 0.510973429388569;

% PUNTO 1
figure(1)
title("Valore di f(x)");
plot(x, f(x));
grid on;

% PUNTO 2
g = @(x) -sin(x) + 1;
h = @(x) x;

% PUNTO 3
figure(2)
plot(x, g(x));
hold on;
plot(x, h(x));
grid on

% PUNTO 4
[x, xall, iter] = puntofisso(g, 0, toll, 1000);

% PUNTO 5
err = abs(sol - xall)/abs(sol);
figure(3)
semilogy(err);