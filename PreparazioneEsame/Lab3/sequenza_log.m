function [iterate] = sequenza_log(x1, N)
    iterate(1) = x1;
    for n = 1:N-1
        iterate(n+1) = (2^n)*(sqrt(1+(iterate(n)/2^(n-1))-1));
    end