function x = meg_backward(U, c)
    % Controllo di validià della funzione

    v = diag(U);

    if triu(U) ~= U
        error("La matrice non è triangolare superiore")
    elseif size(U, 1) ~= size(U, 2)
        error("La matrice non è quadrata")
    elseif v(find(v)) ~= v
        error("La matrice ha elementi sulla diagonale uguali a zero")
    end

    % Risoluzione
    n = size(U, 1);

    x = zeros(size(c));

    x(n) = c(n)/U(n,n);

    for i = n-1:-1:1
        x(i) = (c(i) - U(1, i+1:n)*x(i+1:n))/U(i,i);
    end

end