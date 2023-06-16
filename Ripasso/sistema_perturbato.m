function sistema_perturbato(A, b, Aap, bap)
% Calcolo delle soluzione x e xap
x = A\b;
xap = Aap\bap;

condA = cond(A);

ndeltax = cond(xap - x);
ndeltaa = cond(Aap - A);
ndeltab = cond(bap - b);

% Controllo che la condizione scritta sia rispettata
if condA * (ndeltaa/norm(A)) >= 1
    error('Non è possibile applicare la stima perchè k(A)||deltaA||/||A||>=1');
end

% Calcolo del valore a sinistra e a destra della disuguaglianza
sinistra = ndeltax/norm(x);
destra   = (condA/(1- condA * (ndeltaa/norm(A))))*((ndeltaa/normA) + (ndeltab/norm(b)));    

% Stampa in formato esponenziale %1.2e
fprintf("%1.2e <= %1.2e", sinistra, destra);

end