function demo_quadratura

clear all;
clc;

f = @(x) 1./(x+1);
a = 0; b = 1;

sol = log(2);

t = (b-a)/2*(f(a)+f(b));
et = abs(sol - t);

s = (b-a)/6*(f(a)+f(b)+4*f((a+b)/2));
es = abs(sol - s);

fprintf("Trapezi: %1.4e\n", et);
fprintf("Simpson: %1.4e\n", es);

end