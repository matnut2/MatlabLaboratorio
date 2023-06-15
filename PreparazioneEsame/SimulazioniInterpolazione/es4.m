clear all;
clc;

% Dati
f = @(x) 1./(1+25*x.^2);
s = linspace(-1, 1, 1000);
maxn = 25;
ff = f(s);

errp = zeros(25, 1)';
errc = zeros(25, 1)';

for n = 1:maxn
    xn = linspace(-1, 1, n+1);
    xc = -cos([0:n]*pi / n);

    yn = f(xn);
    yc = f(xc);

    tn = interpol(xn, yn, s);
    tc = interpol(xc, yc, s);

    en(n) = max(abs(tn - ff));
    ec(n) = max(abs(tc - ff));
end

figure(1)
semilogy(1:maxn,en,'ko-','MarkerFaceColor','g');
hold on;
semilogy(1:maxn,ec,'ro-','MarkerFaceColor','b');

legend("Equispaziati", "CL")