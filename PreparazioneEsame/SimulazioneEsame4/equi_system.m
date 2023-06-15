function [U, c] = equi_system(A, b)

    v = diag(A);
    
    if size(A, 1) ~= size(A, 2) | v(find(v)) ~= v | det(A) == 0
        error("La matrice non rispetta le condizioni");
    end
    
    n = size(A, 1);
    
    Akp = zeros(size(A));
    Ak = A;
    c = b;
    
    for i = 2:n
        % la k-1-esima riga rimane invariata
        Akp(i-1, i-1:n) = Ak(i-1, i-1:n);
    
        % pongo gli elementi sotto 
        Akp(i:n, i-1) = 0;
    
        % calcolo del moltiplicatore
        m = Ak(i:n, i-1)/Ak(i-1, i-1);
    
        % Aggiornamento dei valori
        Akp(i:n, i:n) = Ak(i:n, i:n) - m .*Ak(i-1, i:n);
    
        % Setto Ak = Akp per la nuova iterazione
        Ak = Akp;
    end

    U = Akp;
end