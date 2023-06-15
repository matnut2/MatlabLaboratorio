clear all;
clc;

A = [
        1      1/2     1/3;
        1/2    1/3     1/4;
        1/3    1/4     1/5;
    ];

b = [
        11/6; 
        13/12; 
        47/60
    ];

[U, c] = equi_system(A, b);

fprintf("U(2, 3): \t %1.2e \n", U(2,3));

x = meg_backward(U, c);

fprintf("norm(x): \t %4.4f \n", norm(x));