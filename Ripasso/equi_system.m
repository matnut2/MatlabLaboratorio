function [U, c] = equi_system(A, b)

    d = diag(A);

    if det(A) == 0 | d(find(d)) ~= d | size(A, 1) ~= size(A, 2)
        error("La matrice A non rispetta le condizioni per essere ridotta");
    end

    % Inizializzazione delle Variabili
    Akp = zeros(size(A));
    Ak  = A;
    c   = b;
    n   = size(A, 1);

    % Inizio Modifica
    for i = 2:n
    
        % Non modifico la RIGA i-1
        Akp(i-1, i-1:n) = Ak(i-1, i-1:n);
        
        % Pongo la COLONNA i-1 a 0 sotto la RIGA i-1
        Akp(i:n, i-1) = 0;

        % Calcolo il moltiplicatore
        m = Ak(i:n, i-1)./Ak(i-1, i-1);

        % Aggiorno i valori
        Akp(i:n, i:n) = Ak(i:n, i:n) - m.*Ak(i-1, i:n);
        c(i:n) = c(i:n) - m*c(i-1);
    
        Ak = Akp;
    end

    U = Akp;

end