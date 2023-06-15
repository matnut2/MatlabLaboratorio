clear all;
clc;

y1 = @(x) (1-x).^6;
y2 = @(x) x.^6 - 6*x.^6+15*x.^4-20*x.^3+15*x.^2-6*x+1;

delta = [0.1 0.01 0.005 0.0025];
x1 = linspace(1-delta(1), 1+delta(1), 100);
x2 = linspace(1-delta(2), 1+delta(2), 100);
x3 = linspace(1-delta(3), 1+delta(3), 100);
x4 = linspace(1-delta(4), 1+delta(4), 100);

figure(1)
plot(x1, y1(x1));
hold on
plot(x1, y2(x1));

figure(2)
plot(x2, y1(x2));
hold on
plot(x2, y2(x2));

figure(3)
plot(x3, y1(x3));
hold on
plot(x3, y2(x3));

figure(4)
plot(x4, y1(x4));
hold on
plot(x4, y2(x4));