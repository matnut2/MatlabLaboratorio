clear all;
clc;

f = @(x) exp((-1)/1-(x.^2));
a = -1; b = 1;

nodi = 100;

ht = (b-a)/nodi;
xt = a:ht:b; xt = xt';
wt = ones(nodi+1, 1);
wt(1) = 1/2;
wt(end) = 1/2;
wt = wt*ht;

trapezi = sum(wt .* f(xt));