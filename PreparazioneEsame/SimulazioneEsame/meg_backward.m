function [x] = meg_backward(U, c)
% MEG_BACKWARD: Genera la soluzione per il sistema tramite l'algoritmo MEG
%               all'indietro 
% ----- INPUT ------ %
%   U:  Matrice ridotta secondo eliminazione gaussiana
%   c:  Vettore ridotto secondo eliminazione gaussiana
% ----- OUTPUT ----- %
%   x: Vettore delle soluzioni del sistema
% ------------------ %

    %% Controllo del Sistema
    
    % Prima condizione      : controllo che la matrice sia triangolare
    %                         superiore
    % Seconds condizione    : controllo che l matrice sia quadrata
    
    if ( triu(U) ~= U )
        error("La matrice non è triangolare superiore");
    elseif ( size(U,1) ~= size(U,2) )
        error("La matrice non è quadrata");
    end
    
    %% Risoluzione del Sistema
    % Dimensione della matrice quadrata
    n = size(U, 1);
    
    % Inizializzo il vettore soluzione
    x = zeros(size(c));
    
    % Ultima componente di x
    
    x(n) = c(n)/U(n,n);
    % Definisco le successive partendo da quelle già calcolate
    for i = n-1:-1:1
        x(i) = (c(i) - U(i,i+1:n)*x(i+1:n))/U(i,i);
    end

end