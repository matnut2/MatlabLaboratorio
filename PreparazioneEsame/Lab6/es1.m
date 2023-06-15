clear all;
clc;

% DATI
f = @(x) sin(x) + x;
Df = @(x) cos(x) + 1;
x0 = 3;
n = 5;
h_value = logspace(-1,-n,n);

% Ciclo su h per calcolare i vari rapporti incrementali
for i = 1:n
    h = h_value(i); 
    deltaP(i) = (f(x0+h)-f(x0))/h;
    deltaM(i) = (f(x0)-f(x0-h))/h;
    deltaS(i) = (f(x0+h)-f(x0-h))/(2*h);
end

% Valore esatto 
Df_true = Df(x0);

% Errori relativi
errdeltaP = abs(deltaP - Df_true)/abs(Df_true);
errdeltaM = abs(deltaM - Df_true)/abs(Df_true);
errdeltaS = abs(deltaS - Df_true)/abs(Df_true);

% Grafico in scala semilogaritmica degli errori
figure(1)
semilogy(1:n,errdeltaP,'bo-')
hold on;
semilogy(1:n,errdeltaM,'ro-')
semilogy(1:n,errdeltaS,'ko-')
legend('Rap. incre. destro', 'Rap. incre. sinistro', 'Rap. incre. simmetrico')

