function [U, c] = equi_sistem(A, b)
% EQUI_SISTEM: Riduzione della matrice con il metodo di eliminazione
%             gaussiana
% ----- INPUT ------ %
%   A:  Matrice di partenza
%   b:  Vettore dei termini noti
% ----- OUTPUT ----- %
%   U:  Matrice ridotta secondo eliminazione gaussiana
%   c:  Vettore ridotto secondo eliminazione gaussiana
% ------------------ %

    %% Controllo Condizioni di Riduzione in Forma Triangolare
    v = diag(A);
    
    %   Prima condizione:   matrice non singolare, determinante diverso da 0
    %   Seconda condizione: elementi diagonali diversi da 0 
    %   Terza condizione:   matrice quadrata
    if (det(A) == 0 | (v(find(v))~=v) | (size(A,1)~=size(A,2)))
        error("La matrice non rispetta le condizioni");
    end
    
    n = size(A,1); % Dimensione di A (quadrata)

    %% Riduzione della Matrice
    % Inizializzazione delle Variabili
    Akp = zeros(size(A));
    Ak = A;
    c = b;
    
    % Eliminazione Gaussiana
    for i = 2:n % Ciclo sulle iterate
        Akp(i-1,i-1:n) = Ak(i-1,i-1:n); % Riga i-1 non viene cambiata
        Akp(i:n,i-1) = 0; % Colonna sotto l'elemento i-1 viene posta a zero
        m = Ak(i:n,i-1)/Ak(i-1,i-1);  % Aggiorno gli altri elementi della matrice
        Akp(i:n,i:n) = Ak(i:n,i:n) - m.*Ak(i-1,i:n);
        
        % Aggiorno il termine noto
        c(i:n) = c(i:n) - m*c(i-1);
        % Pongo la matrice nuova come quella da cui partire nella nuova iterata
        Ak = Akp;
    end
    
    % Definisco U, output della funzione
    U = Akp;
end