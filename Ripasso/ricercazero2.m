clear all;
clc;

f = @(x) sin(x) + x - 1;
g = @(x) 1 - sin(x);
a = 1/2; b = 3/2;
toll = 10^(-8);
maxit = 1000;
x = linspace(-10, 10, 1000);

figure(1)
hold on
plot(x, f(x));
plot(x, g(x));
grid on

[xs, xall , iter] = puntofisso(g, 1, toll, maxit);

sol = 0.510973429388569;

err = abs(sol - xall)/(abs(sol));

figure(2)
semilogy(err);
