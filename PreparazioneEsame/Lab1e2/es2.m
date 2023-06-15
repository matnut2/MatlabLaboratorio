% DATI
f = @(x) cosh(x);
p = @(x) 1 + ((x.^2)/2)+((x.^4)/24);
x = linspace(-3, 3);

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
