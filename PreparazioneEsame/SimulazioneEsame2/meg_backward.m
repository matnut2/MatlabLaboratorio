function x = meg_backward(U,c)

% Controllo se la matrice è triangolare superiore
if(triu(U)~=U)
    error('La matrice non è triangolare superiore!')
elseif (size(U,1)~=size(U,2))
    errore('La matrice non è quadrata')
end

% Dimensione della matrice quadrata
n = size(U,1);

% Inizializzo il vettore soluzione
x = zeros(size(c));
% Ultima componente di x
x(n) = c(n)/U(n,n);
% Definisco le successive partendo da quelle già calcolate
for i = n-1:-1:1
    x(i) = (c(i) - U(i,i+1:n)*x(i+1:n))/U(i,i);
end

end