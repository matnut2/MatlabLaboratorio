clear all;
clc;

f = @(x) ((1+x)-1)./x;
x = linspace(-1e-10, 1e-10);
sol = 1;

err = abs(f(x)-sol)/abs(sol);

figure(1)
plot(x, f(x));

figure(2);
semilogy(err);