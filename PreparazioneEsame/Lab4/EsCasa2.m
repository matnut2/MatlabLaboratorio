clear all;
clc;

% DATI 
f = @(x) log(x + 2)^2;
Df = @(x) (2*log(x+2))/(x+2);
x0 = 0;
toll = 10^(-8);
sol = -1;

% NEWTON CLASSICO
[xc, xallc, iterc] = newton(f, Df, x0, toll, 1000);

% NEWTON MOD
[xm, xallm, iterm] = newton2(f, Df, x0, 2, toll, 1000);

% ERRORE CLASSICO
errc = abs(sol - xallc)/abs(sol);

% ERRORE MOD
errm = abs(sol- xallm)/abs(sol);

% PLOT
figure(1);
title("Andamento dell'errore")
semilogy(errc);
hold on;
semilogy(errm);
legend("Classica", "Mod");
xlabel("iter");
ylabel("errore");