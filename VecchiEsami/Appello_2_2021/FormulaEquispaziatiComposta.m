function [x, w] = FormulaEquispaziatiComposta(a, b, N, n)
    % Presi in ingresso gli estremi a e b, il numero N di sottointervalli e
    % il grado n di precisione polinomiale, restituisca in uscita il
    % vettore riga x contenente gli Nn+1 nodi e il vettore colonna w
    % contenente gli Nn+1 pesi.
    % Questo si ottiene componendo le N formule interpolatorie prodotto con
    % FormualEquispaziata su ciascuno degli N sottointervalli.
    % L'algoritmo implementato si riassume con: calcolo gli estremi p dei
    % sotto-intervalli, ciclo for sui sottointervalli per il calcolo dei
    % nodi e dei pesi locali e all'interno dello stesso ciclo
    % l'assemblaggio di nodi e pese.
    % ATTENZIONE: nell'assemblaggio delle x non vanno ripetuti i nodi
    % (l'ultimo nodo di un intervallo è il primo del seguente). Al
    % contrario i pesi dei nodi ripetuti vanno sommati.

    % Definizione dei sottointervalli
    pts = linspace(a,b, N+1)
    
    % Preparazione di x
    x=zeros(1,N*n+1); w=x';

    % Calcolo locale e assemblaggio
    for k = 1:N
        [xloc,wloc]=FormulaEquispaziata(pts(k),pts(k+1),n);
        x(n*(k-1)+1:n*k+1)=xloc;
        w(n*(k-1)+1:n*k+1)=w(n*(k-1)+1:n*k+1)+wloc;
    end
end