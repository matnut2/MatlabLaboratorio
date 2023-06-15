clear all;
clc;

f = @(x) (x-1).^2;
df =@(x) 2*(x-1);
a = 0; b = 3;
x0 = 0;
maxit = 28;
toll = 10^(-8);
sol = 1;

[zerob, iteratesb] = bisezione(f, a, b, maxit, toll);
[zeron, iteratesn] = newton(f, df, x0, maxit, toll);

errb = abs(iteratesb - sol);
errn = abs(iteratesn - sol);

clf
figure(1)
semilogy(errb);
hold on
semilogy(errn);