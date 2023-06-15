function [zero, iterates] = newton(f, df, x0, maxit, toll)
    if df(x0) == 0
        error("La derivata in x0 è uguale a 0");
    end

    dx = -f(x0)/df(x0);
    zero = x0 + dx;
    iter = 1;
    iterates(iter) = zero;

    while abs(dx) > toll && iter < maxit
        x0 = zero;

        if df(x0) == 0
            break
        end

    dx = -f(x0)/df(x0);
    zero = x0 +dx;
    iter = iter+1;
    iterates(iter) = zero;

    end
end