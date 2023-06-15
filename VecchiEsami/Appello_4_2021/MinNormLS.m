function [x, r, res] = MinNormLS(A, b, toll)
    % INPUT
    % A = Matrice Quadrata
    % b = Vettore Colonna
    % toll = tolleranza, scalare
    % OUTPUT
    % x = soluzione di minima norma delle equazioni normali, vettore
    %     colonna
    % r = rango della matrice A
    % res = norma del residuo delle equazioni normali
    
    % Passo 1
    [Q, R] = qr(A);

    % Passo 2
    r = sum(abs(diag(R)) >= length(A)*toll);

    % Passo 3
    R0 = R(1:r, :);
    Q0 = Q(:, 1:r);
    S = R0 * R0;

    % Punto 4
    [L,U,P] = lu(S);
    y  = U\(L\(P * R0 * b)); 
    
    %% Punto 5 – calcolo di x = Q0 * y e della norma del residuo ||AtAx – Atb||
    x = Q0 * y;
    res = norm(A' * A * x - A' * b);

end