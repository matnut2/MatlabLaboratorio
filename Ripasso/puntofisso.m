function [x,xall,iter] = puntofisso(g,x0,tol,max_iter)

% Iterazione di punto fisso per la soluzione di equazioni nonlineari
% --------------- Inputs -------------------------------------------------
%               g        funzione di cui vogliamo trovare il punto fisso
%               x0       valore iniziale 
%               tol      tolleranza per la condizione di arresto
%               max_iter numero massimo di iterazioni
% --------------- Outputs ------------------------------------------------
%               x        soluzione finale
%               xall     vettore con tutte le iterazioni
%               iter     numero di iterazioni
% ------------------------------------------------------------------------

iter = 1;       % iter corresponde all n della lezione
x = g(x0);                                            % Prima iterazione
xall(iter) = x;

while (abs(x-x0) > tol) && (iter < max_iter)          % ciclo iterativo con condizioni di arresto
  x0 = x;
  x = g(x0);                                          % nuova valutazione di g
  iter = iter + 1;                                    % nuovo numero di iterazione
  xall(iter) = x;                                     % salva x in xall
end

end

