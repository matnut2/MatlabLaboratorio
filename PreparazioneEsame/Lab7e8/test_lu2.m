clear all;
clc;

A = magic(10);
b = A*[1:10]';

x_corretta = A\b;
x = lu_solver(A, b);
dif = norm(x-x_corretta);