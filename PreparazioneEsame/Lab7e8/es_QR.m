clear all;
clc;

f = @(x) sin(2*x)-x.^2;
n = 100;
x = linspace(-5,5,n);
d = 8;

t = linspace(-5,5,1000);
y = f(x); 
y = y + 0.5*rand(size(y)); % aggiunta di rumore

true_fun = f(t);

%% Soluzione Polyfit/Polyval
coeff = polyfit(x, y, d);
rec = polyval(coeff, t);

figure(1)
plot(x,y,'ob')
hold on
plot(t,true_fun,'-r','LineWidth',2)
plot(t,rec,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: polyfit/polyval')

%% Soluzione Equazioni Normali
V = fliplr(vander(x));
A = V(:,1:d+1);
coeffs_normal = (A'*A)\(A'*y'); % Calcolo i coeff con le eq normali
rec_normal = polyval(coeffs_normal(end:-1:1),t);

fprintf('\n \t Condizionamento della matrice A^t A: %1.2e \n', cond(A'*A))

figure(2)
plot(x,y,'ob')
hold on
plot(t,true_fun,'-r','LineWidth',2)
plot(t,rec_normal,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: equazioni normali')

%% Soluzione QR
V = fliplr(vander(x));
A = V(:,1:d+1);
% Decomposizione QR
[Q,R] = qr(A);

% Restringo le matrici
Q1 = Q(:,1:d+1);
R1 = R(1:d+1,1:d+1);

b = Q1'*y';
coeffs_qr = R1\b; % Calcolo i coefficienti con QR

rec_qr = polyval(coeffs_qr(end:-1:1),t); % Si veda sopra

fprintf('\n \t Condizionamento della matrice R: %1.2e \n', cond(R1))

figure(3)
plot(x,y,'ob')
hold on
plot(t,true_fun,'-r','LineWidth',2)
plot(t,rec_qr,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: scomposizione QR')

figure(4)
title("Ricostruzioni a Confronto")
plot(rec);
hold on;
plot(rec_qr);
plot(rec_qr);
legend("Polyfit/Polyval", "Normali", "QR");