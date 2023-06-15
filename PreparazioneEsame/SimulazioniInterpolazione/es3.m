clear all;
clc;

f = @(x) (exp(-2*x)/3)+ x.^2 + 7*x.^3;

n = 8;
x = -cos([0:n]*pi/n);
y = f(x);

s = linspace(-1, 1, 500);

coeff = polyfit(x, y, n-1);
t = polyval(coeff, s);

figure(1)
hold on
plot(x, y, 'xr');
plot(s, t, '-b');