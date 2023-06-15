clear all;
clc;

A = magic(9);
b = [910 1034 1113 1264 1172 981 1060 941 750]';

x_corretta = A\b;
x = lu_solver(A, b);
dif = norm(x-x_corretta);