clear all;
clc;

f = @(x) exp(x) - 2 + x;
Df = @(x) exp(x) + 1;
a = -2; b = 2;
toll = 10^(-8);
maxit = 1000;
x = linspace(-10, 10, 1000);
x0 = 0;

figure(1)
hold on
plot(x, f(x));
plot(x, Df(x));
grid on

[xs, xall , iter] = newton(f, Df, x0, toll, maxit);

sol = 0.442854401002389;

err = abs(sol - xall)/(abs(sol));

figure(2)
semilogy(err, '-ok');