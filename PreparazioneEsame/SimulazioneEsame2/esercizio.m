clc;
clear all;
% Matrice e vettore termine noto relativi al sistema lineare
A = [1,1/2,1/3; 1/2, 1/3, 1/4; 1/3,1/4,1/5];
b = [11/6;13/12;47/60];

% Triangolarizzazione della matrice e consequente aggiustamento del termine
% noto
[U,c] = equi_sistem(A,b);

% Elemento U(2,3)
fprintf('\n \t U(2,3): %1.2e \n',U(2,3))

% Calcolo della soluzione
x = meg_backward(U,c);

% Norma della soluzione
fprintf('\n \t Norma di x: %4.4f \n', norm(x))