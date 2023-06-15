function [x, w] = FormulaEquispaziata(a, b, n)
    % Presi in ingresso gli estremi a e b e il grado n, restituire il
    % vettore riga x dei nodi di interpolazione e il vettore colonna w dei
    % pesi
    % La soluzione del sistema deve essere implementata con il metodo di
    % fattorizzazione LU di matlab (x = A\b)

    % Creazione dei nodi equidistanziati
    x = linspace(a, b, n+1);

    % Creazione della matrice A (?)
    A = x.^((0:n)');
    display(A);

    % Creazione del vettore riga c'
    c = (b.^((1:n+1)')-a.^((1:n+1)'))./((1:n+1)');

    % Risoluzione tramite fattorizzazione LU
    [L,U,P] = lu(A);
    z=L\(P*c);
    w=U\z;
end