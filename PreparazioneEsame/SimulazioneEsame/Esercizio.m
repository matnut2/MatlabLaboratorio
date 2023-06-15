clear all;
clc;

% DATI DEL PROBLEMA
A = [
        1   1/2 1/3;
        1/2 1/3 1/4;
        1/3 1/4 1/5;
    ]

b = [
        11/6;
        13/12;
        47/60;
    ]

% Eliminazione gaussiana
[U, c] = equi_sistem(A, b);

% Stampa di U(2,3)
fprintf("U(2, 3): \t%1.2e\n", U(2, 3));

% Risoluzione del Sistema
x = meg_backward(U, c);

% Norma della soluzione
fprintf('Norma di x: \t %4.4f \n', norm(x))