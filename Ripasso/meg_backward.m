function x = meg_backward(U, c)

    d = diag(U);

    if triu(U) ~= U
        error("La matrice U non è triangolare superiore");
    elseif size(U, 1) ~= size(U, 2)
        error("La matrice non è quadrata");
    elseif d(find(d)) ~= d
        error("Uno o più elemente della diagonale sono uguali a zero");
    end

    n = size(U, 1);
    x = zeros(size(c));
    
    x(n) = c(n)/U(n,n);

    for i = n-1:-1:1
    
        x(i) = (c(i) - U(i, i+1:n)*x(i+1:n))/U(i,i);

    end

end