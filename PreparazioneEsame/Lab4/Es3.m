clear all;
clc;

% DATI
f = @(x) exp(x) - 2 + x;
Df = @(x) exp(x) + 1;
x = linspace(-2, 2);
x0 = 0;
toll = 10^(-6);
sol = 0.442854401002389;

% PUNTO 1
figure(1)
plot(x, f(x));
grid on;

% PUNTO 2
[x, xall , iter] = newton(f, Df, x0, toll, 1000);

% PUNTO 3
err = abs(sol - xall)/abs(sol);

% PUNTO 4
figure(2)
semilogy(err)