function demo_quadratura2
    clear all;
    clc;

    f = @(x) 1./(1+x);
    a = 0; b = 1;

    Nmax = 20;

    for N = 1:Nmax
        [xt, wt] = trapezi_composta(a, b, N);
        [xs, ws] = simpson_composta(a, b, N);

        solt(N) = f(xt)' * wt;
        sols(N) = f(xs)' * ws;
    end

    errt = abs(log(2) - solt);
    errs = abs(log(2) - sols);

    figure(1);
    semilogy(1:Nmax, errt, '-ob');
    hold on
    semilogy(1:Nmax, errs, '-or');
end