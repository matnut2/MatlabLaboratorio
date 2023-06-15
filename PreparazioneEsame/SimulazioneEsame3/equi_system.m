function [ U, c ] = equi_system( A , b )
    v = diag(A);

    if det(A) == 0 | v(find(v)) ~= v | size(A, 1) ~= size(A, 2)
        error("La matrice A non rispetta le condizioni: non è singolare e\o ha alcuni elementi diagonali uguali a zero");
    end

    n = size(A, 1);

    Akp = zeros(size(A));
    Ak = A;
    c = b;

    for i = 2:n
        Akp(i-1, i-1:n) = Ak(i-1, i-1:n);       % Non modifico la i-1-esima riga
        Akp(i:n, i-1) = 0;                      % Pongo a zero la colonna sotto l'elemento i-1-esimo
        m = Ak(i:n, i-1)/Ak(i-1,i-1);           % Calcolo del moltiplicatore
        % Aggiornamento della matrice
        Akp(i:n, i:n) = Ak(i:n, i:n) - m.*Ak(i-1, i:n);

        % Aggiorno il vettore risultato
        c(i:n) = c(i:n) - m .* c(i-1);

        % Aggionro Ak per la prossima iterazione
        Ak = Akp;
    end

    % Definizione di U
    U = Akp;
end