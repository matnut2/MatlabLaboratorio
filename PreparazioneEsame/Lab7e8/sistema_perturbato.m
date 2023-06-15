function sistema_perturbato(A, b, Aap, bap)
    
    x = A\b;
    xap = Aap\bap;

    condizionamentoA = cond(A);

    Ndeltax = norm(xap-x);
    NdeltaA = norm(Aap - A);
    Ndeltab = norm(bap-b);

    if cond(A)*(NdeltaA)/norm(A) >= 1
        error('Non è possibile applicare la stima perchè k(A)||deltaA||/||A||>=1');
    end

    sinistra = norm(Ndeltax)/norm(x);
    fprintf("Valore a sinistra:\t\t%1.2e\n", sinistra);

    destra = (cond(A) / ((1-(cond(A)*(NdeltaA)/norm(A)))*(NdeltaA/norm(A)) + (Ndeltab / norm(b))));
    fprintf("Valore a destra:\t\t%1.2e\n", destra);

    Stima = condizionamentoA/(1-condA*NdeltaA/norm(A))*(NdeltaA/norm(A)+Ndeltab/norm(b));

    fprintf('Il valore %1.2e è infatti minore di %1.2e \n',Ndeltax/norm(x),Stima);

end