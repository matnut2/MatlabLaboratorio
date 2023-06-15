function [U, c] = equi_sistem(A, b)
    % Controllo che il sistema sia riducibile, altrimenti restitusco errore
    v = diag(A);
    if det(A) == 0 | size(A, 1) ~= size(A, 2) | v(find(v)) ~= v
        error("La matrice non può essere ridotta")
    else
        % Dimensione di A (che è quadrata)
        n = size(A, 1);
        Akp = zeros(size(A));
        Ak = A;
        c = b;

        % Riduco la matrice
        for i = 2:n
            disp("ciclo " + i);
            disp(Ak)
            % Non cambio la i-1-esima riga
            Akp(i-1, i-1:n) = Ak(i-1, i-1:n);
            % Pongo la colonna sotto l'elemento i-1-esimo viene posta 0
            Akp(i:n, i-1) = 0;
            disp(Akp)

            % Aggiorno gli altri elementi della matrice
            m = Ak(i:n, i-1)/Ak(i-1, i-1);
            disp(m);
            Akp(i:n,i:n) = Ak(i:n,i:n) - m.*Ak(i-1,i:n);
            disp(Akp);
            % Aggiorno il termine noto
            c(i:n) = c(i:n) - m*c(i-1);
            disp(c);
            % Pongo la matrice nuova come quella da cui partire nella nuova iterata
            Ak = Akp;
        end

        U = Akp;
    end
end