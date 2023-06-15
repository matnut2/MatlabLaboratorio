clear all;
clc;

f = @(x) 1 ./ (1 + x.^2);

s = linspace(-5, 5, 1000);
x1 = linspace(-5, 5, 6);
x2 = linspace(-5, 5, 11);

n1 = 6;
n2 = 11;

x3 = -cos([0:n1].*pi / n1);
x4 = -cos([0:n2].*pi / n2);

plot(s, f(s));

coeff1 = polyfit(x1, f(x1), 6);
coeff2 = polyfit(x2, f(x2), 11);
coeff3 = polyfit(x3, f(x3), 5);
coeff4 = polyfit(x4, f(x4), 10);

y1 = polyval(coeff1, s);
y2 = polyval(coeff2, s);
y3 = interp1(x3, f(x3), s, 'spline');
y4 = interp1(x4, f(x4), s, 'spline');

hold on;
plot(s, y1);
plot(s, y2);
plot(s, y3);
plot(s, y4);
legend("originale", "6 nodi eq", "11 nodi eq", "6 nodi cl", "11 nodi cl");

err1 = max(abs(y1 - f(s)));
err2 = max(abs(y2 - f(s)));
err3 = max(abs(y3 - f(s)));
err4 = max(abs(y4 - f(s)));

fprintf("Massimo Errore Assoluto -> 6 nodi eq \t %f\n", err1);
fprintf("Massimo Errore Assoluto -> 11 nodi eq \t %f\n", err2);
fprintf("Massimo Errore Assoluto -> 6 nodi cl \t %f\n", err3);
fprintf("Massimo Errore Assoluto -> 11 nodi cl \t %f\n", err4);
