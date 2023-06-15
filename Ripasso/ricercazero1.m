clear all;
clc;

f = @(x) exp(x) - 2 + x;
a = 0; b = 1;
toll = 10^(-8);
maxit = 1000;
x = linspace(a, b, 1000);
sol = 0.4428544010023885;

figure(1);
plot(x, f(x), '-.k');

if f(a)*f(b) < 0
    disp("Metodo della Bisezione Disponibile");
else
    error("Metodo della bisezione non applicabile");
end

[x, xall, iter] = bisezione(f, a, b, toll, maxit);

err = abs(xall - sol)/abs(sol);

figure(2)
semilogy(err)