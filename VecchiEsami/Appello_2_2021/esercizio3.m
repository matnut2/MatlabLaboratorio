f = @(x) sqrt(x);
a = 0; b = 1;

for s = 1:50
    [x1, w1] = FormulaEquispaziatiComposta(a, b, 2, s);
    [x2, w2] = FormulaEquispaziatiComposta(a, b, s, 2);

    I(s) = f(x1)*w1;
    IE(s) = sum(abs(w1));
    J(s) = f(x2)*w2;
    JE(s) = sum(abs(w2));
end

figure(1);
semilogy(abs(I-2/3))
hold on
semilogy(abs(J-2/3))
title('errori di quadratura')
legend('N=2, n=1,2,..,50', 'N=1,2,...,50, n=2')

% parte facoltativa
figure(2);
semilogy(IE);
hold on
semilogy(JE)
title('fattori di stabilità')
legend('N=2, n=1,2,..,50', 'N=1,2,...,50, n=2')

fprintf('Le formule a grado alto diventano molto instabili\n')