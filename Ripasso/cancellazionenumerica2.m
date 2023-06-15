clear all;
clc;

n = 1e+2;
sol = pi;

% Successione S_n
Sn1(1) = 1;

for i = 2:n
    Sn1(i) = Sn1(i-1) + 1/(i.^2);
end

SN1 = sqrt(6*Sn1);

errSN1 = abs(SN1 - sol)/abs(sol);

figure(1)
semilogy(errSN1, '-.k');

% Successione di Archimede (instabile)
x(1) = 2;

for i = 3:n
    x(i-1) = (2^(i-(1/2)))* sqrt(1 - sqrt(1-4^(1-(i-1))*(x(i-2)^2)));
end

% Successione di Archimede (stabile)
y(1) = 2;
for i = 3:n
    y(i-1) = sqrt(2)*y(i-2)/sqrt(1+sqrt(1-4^(1-(i-1))*y(i-2)^2));
end
errx = abs(x - sol)/abs(sol);
erry = abs(y - sol)/abs(sol);

figure(1)
hold on
semilogy(errx, 'r');
semilogy(erry, '--b');
