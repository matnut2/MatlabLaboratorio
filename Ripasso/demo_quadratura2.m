function demo_quadratura2
    clear all;
    clc;
    
    f = @(x) 1./(x+1);
    a = 0; b = 1;
    
    sol = log(2);
    maxn = 20;
    
    errt = zeros(1, maxn);
    errs = zeros(1, maxn);
    t = zeros(1, maxn);
    s = zeros(1, maxn);
    
    for i = 1:1:maxn
        [xt, wt] = trapezi_composta(a, b, i);
        [xs, ws] = simpson_composta(a, b, i);

        t(i) = sum(f(xt)'*wt);
        s(i) = sum(f(xs)'*ws);
    end

    et = abs(t - sol)/abs(sol);
    es = abs(s - sol)/abs(sol);

    figure(1)
    semilogy(et);
    hold on
    semilogy(es);
    legend("Trapezi", "Simpson")

end