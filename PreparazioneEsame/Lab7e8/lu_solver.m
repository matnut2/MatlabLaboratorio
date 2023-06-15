function [x] = lu_solver(A, b)
    
    if (size(A, 1) ~= size(A, 2))
        error("La matrice non è quadrata");
    end

    if det(A) == 0
        error("Matrice non invertibile");
    end

    [L, U, p] = lu(A);
    y = L\(p*b);
    x = U\y;
end