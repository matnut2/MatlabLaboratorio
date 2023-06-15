% Pulizia Generale
clear all;
clc;

% Dati del Problema
f = @(x) ((x.^2) - 1).*(log(x+1) - x);
Df = @(x) 2*x.*(log(x+1)-x)-(x.^2-1).*x./(x+1);
x = linspace(-1, 1);
x0 = -0.6;
toll = 10^(-8);
max_iter = 100;

% Plotting
figure(1);
plot(x, f(x), '-r');
title("Funzione Originale");

%% Punto 1

% Calcolo dei Risultati
[zero, res, iterates, flag] = Newton(f, Df, x0, toll, max_iter, 's');

% Plotting
figure(2);
steps=abs(iterates(2:end)-iterates(1:end-1)); % Scarti (rispetto all'iterata precedente)
plot(steps, '-r');
hold on
semilogy(abs(iterates), '-b'); % Residui (al netto dello scarto)
legend('scarti','residui')
title('profilo di convergenza Newton')

%% Punto 2
m = 2; %Molteplicità dello 0

% Calcolo dei Risultati
[zeromod, resmod, iteratesmod, flagmod] = NewtonMod(f, Df, x0, m, toll, max_iter, 's');

% Plotting
figure(3);
stepsmod=abs(iteratesmod(2:end)-iteratesmod(1:end-1)); % Scarti (rispetto all'iterata precedente)
plot(stepsmod, '-r');
hold on
semilogy(abs(iteratesmod), '-b'); % Residui (al netto dello scarto)
legend('scarti','residui')
title('profilo di convergenza Newton')