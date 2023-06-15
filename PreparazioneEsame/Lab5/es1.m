clear all;
clc;

% DATI
f = @(x) ((exp(-2*x))/3) + x.^2 + 7*x.^3;
n = 5;
x = linspace(-1, 1, n + 1);
y = f(x);
s = linspace(-1, 1, 500);

t = interpol(x, y, s);

% PLOT
figure(1)
hold on;
plot(s, f(s), '-b');
plot(s, t, '--r');

err = max(abs(t - f(s)));