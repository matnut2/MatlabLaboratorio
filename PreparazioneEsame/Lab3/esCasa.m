clc;
clear all;

p1 = sequenza_log(1, 70);

for i = 1:70
    fprintf("Iterazione %d: %4.0f\n", i, p1(i))
end

for i = 1:70
    fprintf("Iterazione %d: %1.4e\n", i, p1(i))
end

sol = log(1 + 1);
err = abs(p1 ./ sol)/abs(sol);

semilogy(err);