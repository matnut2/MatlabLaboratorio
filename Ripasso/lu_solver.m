function x = lu_solver(A, b)

    if size(A,1) ~= size(A,2)
        error('Matrice non quadrata')
    end
    
    if det(A) == 0
        error('Matrice non invertibile')
    end
    [L, U, P] = lu(A);
    
    y = L\(P*b);
    x = U\y;

end