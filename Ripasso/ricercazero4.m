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

[xsn, xalln , itern] = newton(f, Df, x0, toll, maxit);
[xsm, xallm , iterm] = bisezione2(f, a, b, toll, maxit);
[xsb, xallb , iterb] = bisezione(f, a, b, toll, maxit);

sol = 0.442854401002389;

errn = abs(sol - xalln)/(abs(sol));
errm = abs(sol - xallm)/abs(sol);
errb = abs(sol - xallb)/abs(sol);

figure(2)
hold on
semilogy(errn, '-ok');
semilogy(errm, 'Or', 'MarkerFaceColor','r');
semilogy(errb, '-og');
legend("Newton", "Bisezione Pesata", "Bisezione");