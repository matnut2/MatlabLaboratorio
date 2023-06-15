function [l] = lagrai_target(z, x, i)
%------------------------------------------------
% Calcola l’i-esimo pol. elementare di Lagrange su un vettore di punti di valutazione
%------------------------------------------------
% z = nodi di interpolazione
% x = vettore (colonna!) di punti di valutazione su cui valutare l_i
% i = indice del polinomio
% l = vettore dei valori di l_i sui targets
%------------------------------------------------
n = length(z);      % Lunghezza di Z
m = length(x);      % Lunghezza di x

% prod  : la funzione restituisce la produttoria degli elementi di un array
% repmat: la funzione restituisce una copia di array, in questo caso
% riarrangia una lista di 2 scalari come copie di x

% Il vettore 'l' viene configurato come la produttoria della differenza tra
% x e z su 2 dimensioni diviso per la produttoria di z sull'indice del
% polinomio
l = prod(repmat(x,1,n-1)-repmat(z([1:i-1,i+1:n]),m,1),2)/...
prod(z(i)-z([1:i-1,i+1:n])); 
end