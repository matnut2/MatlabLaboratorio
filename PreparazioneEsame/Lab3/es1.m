% DATI
f = @(x) ((1+x)-1)./x;
x = linspace(-1e-10, 1e-10);
err = @(x) abs(f(x)-1);

figure(1)
plot(x, f(x), '-r');
grid on

figure(2)
semilogy(x, err(x));
