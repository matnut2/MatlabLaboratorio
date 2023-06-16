clear all;
clc;

f = @(x) sin(2*x)-x.^2;
n = 100;
d = 8;
x = linspace(-5, 5, n);
t = linspace(-5,5,1000);

y = f(x); y = y + 0.5*rand(size(y));
fun = f(t);

%% Utilizzo di Polyfit e Polyval
coeff1 = polyfit(x, y, d);
y1 = polyval(coeff1, t);

figure(1)
plot(x,y,'ob')
hold on
plot(t,fun,'-r','LineWidth',2)
plot(t,y1,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Polyfit/Polyval')

%% Equazioni Normali
V1 = fliplr(vander(x));
A = V1(:, 1:d+1);
coeff2 = (A'*A)\(A'*y');
y2 = polyval(coeff2(end:-1:1), t);

figure(2)
plot(x,y,'ob')
hold on
plot(t,fun,'-r','LineWidth',2)
plot(t,y2,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Equazioni Normali')

%% Decomposizione QR
V2 = fliplr(vander(x));
B = V2(:, 1:d+1);

[Q, R] = qr(A);

Q1 = Q(:, 1:d+1);
R1 = R(1:d+1, 1:d+1);

coeff3 = R1\(Q1'*y');
y3 = polyval(coeff3(end:-1:1), t);

figure(3)
plot(x,y,'ob')
hold on
plot(t,fun,'-r','LineWidth',2)
plot(t,y3,'-b','LineWidth',2)
legend('Nodi','Funzione','Ricostruzione')
title('Decomposizione QR')

