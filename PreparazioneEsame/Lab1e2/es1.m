% DATI
f = @(x) sin(x);
p = @(x) x - ((x.^3)/6);
x = linspace(0, 2*pi);
err = @(x) abs(f(x)-p(x));

% PUNTO 1
figure(1)
title("f e p sul piano cartesiano")
plot(x, f(x), '-r');
hold on
plot(x, p(x), '--b');
legend("f(x)", "p(x)");

% PUNTO 2
figure(2)
title("Errore tra f e p sul piano cartesiano")
plot(x, err(x), '--r');
legend("err(x)")

% PUNTO 3
figure(3)
title("Errore tra f e p sul piano cartesiano in scala semilogaritmica")
semilogy(x, err(x), '--r');
legend("err(x)")

