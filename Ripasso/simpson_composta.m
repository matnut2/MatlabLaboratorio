function [x,w] = simpson_composta(a,b,N)

% Formula dei trapezi composta
% -----------------------------
% ---- input ----
% a,b : estremi di integrazione
% N : numero di subintervalli
%
% ---- output ----
% x : nodi di integrazione (vettore colonna)
% w : pesi di integrazione (vettore colonna)

% passo di integrazione
h = (b-a)/(2*N); 
% nodi di integrazione
x = a:h:b; x=x'; 
% pesi di integrazione
w = zeros(2*N+1,1);
% primo e ultimo peso
w(1) = h/3 ; 
w(end) = h/3;
% pesi di indice pari
ind_pari = 2:2:2*N ;
w(ind_pari) = 4*h/3;
% pesi di indice dispari
ind_disp = 3:2:2*N-1;
w(ind_disp) = 2*h/3;

% In una riga
% w=h.*[1,repmat([4 2],1,N−1),4,1]./3;
