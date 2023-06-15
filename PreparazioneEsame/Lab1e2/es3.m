% DATI
N = 5000;
x = zeros(1,N);
f = @(n) 2*n/(2*n-1)*2*n/(2*n+1);

% PUNTO 1
for i = 1:N
    if i == 1
        x(i) = f(1);
    else
        x(i) = f(i)*x(i-1);
    end
end

x = 2*x;

% PUNTO 2
figure(1)
title("Andamento della produttoria")
plot(x);
legend("Valore della Produttoria")
ylabel("Valore")
xlabel("Iterazione")

figure(2)
semilogy(1:N, abs(pi-x),'k-')
title('Prodotto di Wallis: errore assoluto') 