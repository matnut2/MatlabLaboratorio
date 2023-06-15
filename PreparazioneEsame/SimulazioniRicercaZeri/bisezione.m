function [zero, iterates] = bisezione(f, a, b, maxit, toll)

    iter = 1;
    zero = (a+b)/2;
    
    iterates(iter) = zero;

    while abs(f(zero)) > toll && iter < maxit
        if f(zero) == 0
            return;
        elseif f(zero)*f(a) < 0
            b = zero;
        else
            a = zero;
        end

        iter = iter+1;
        zero = (a+b)/2;
        iterates(iter) = zero;
    end



end