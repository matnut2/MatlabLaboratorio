function x = meg_backward(U, c)

    v = diag(U);

    if triu(U) ~= U
        error("La matrice U non è triangolare superiore");
    elseif size(U, 1) ~= size(U, 2)
        error("La matrice U non è quadrata");
    elseif v(find(v)) ~= v
        error("I valori della diagonale di U sono pari a 0");
    end

    n = size(U, 1);
    x = zeros(size(c));

    x(n) = c(n)/U(n,n);

    for i = n-1:-1:1
        x(i) = (c(i) - U(i, i+1:n)*x(i+1:n))/U(i,i);
    end
end