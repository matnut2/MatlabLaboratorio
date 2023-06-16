clear all;
clc;

n = 1;
x = linspace(0, 1, 20);
y_exact = @(x) 2*x + 0.2;
y = 2*x + 0.2 + 0.1*(rand(size(x))); y = y';

V = fliplr(vander(x));
A = V(:, 1:2);

coeff = (A'*A)\(A'*y);

s = linspace(0, 1, 2000);
approx = coeff(1) + coeff(2)*s;

figure(1)
plot(x,y','ko','MarkerFaceColor','g');
hold on;
plot(s,approx,'b');
plot(s, y_exact(s));
grid on;
legend("Perturbata", "Approssimata", "Reale");