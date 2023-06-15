clear all;
clc;

% DATI
f = @(x) sin(x) + exp(-0.2*x);
n = 8;
x = linspace(-5*pi, 5*pi, 10);

figure(1)
hold on
plot(x, f(x), "xr");

coeff = polyfit(x, f(x), n+1);
x1 = linspace(-5*pi, 5*pi, 100);
y1 = polyval(coeff, x1);

figure(1)
plot(x1, y1, "-b");