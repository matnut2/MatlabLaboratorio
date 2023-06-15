function [x,xall,iter] = newton_mod(f,Df,x0,m,tol,max_iter)
% ----------- Inputs ---------
%  f:        funzione di cui vogliamo trovare la radice
%  Df:       derivata della funzione
%  x0:       valore iniziale 
%  m:        molteplicità della radice
%  tol:      tolleranza per la condizione di arresto
%  max_iter: numero massimo di iterazioni
% ----------- Outputs ---------
%  x:        la soluzione trovata
%  xall:     tutte le approssimazioni nelle varie iterazioni
%  iter:     numero di iterazioni fatte
%----------------------------------
dx = -m*f(x0)/Df(x0);
x = x0+dx;
iter = 1;
xall(iter) = x;

while (abs(x-x0) > tol*abs(x)) && (iter <= max_iter)
  x0 = x;
  dx = -m*f(x0)/Df(x0);
  x = x0 + dx;
  iter = iter + 1;
  xall(iter) = x;
end

end

