clear all;
close all;
clc;

f = @(x) log(x+2).^2;

x = linspace(-2,2,100);

% Plot della funzione f in [-2,2]
figure(1)
plot(x,f(x),'b')

% Inizializzo i valori per il metodo di Newton
x0 = 0;
tol = 1e-8;
max_iter = 500;
Df = @(x) 2*log(x+2)./(x+2);
% Metodo di Newton
[x,xall,iter] = newton(f,Df,x0,tol,max_iter);

% Calcolo errore relativo
sol = -1;
err_rel = abs(xall-sol)/abs(sol);

% Metodo di Newton modificato
[xM,xallM,iterM] = newton_mod(f,Df,x0,2,tol,max_iter);
err_relM = abs(xallM-sol)/abs(sol);

% Plot in semilogy di err_rel
figure(2)
semilogy(1:iter, err_rel,'ko-','MarkerEdgeColor','m')
hold on;
semilogy(1:iterM, err_relM,'bo-','MarkerFaceColor','g')