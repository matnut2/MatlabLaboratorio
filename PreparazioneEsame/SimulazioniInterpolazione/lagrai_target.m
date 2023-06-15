function [l] = lagrai_target(z, x, i)
    % La funzione restituisce il vettore colonna delle valutazioni di l_i
    % sui punti x

    n = length(z);
    m = length(x);

    rep1 = repmat(x,1,n-1);
    disp(rep1);
    rep2 = repmat(z([1:i-1,i+1:n]),m,1);
    disp(rep2);
    diff  = rep1-rep2;
    disp(diff);
    numeratore = prod(diff, 2);
    disp(numeratore);
    
    z1 = z(i);
    disp(z1);
    z2 = z([1:i-1,i+1:n]);
    disp(z2);
    denominatore = prod(z1-z2);
    disp(denominatore);
    l = numeratore/denominatore;
    disp(l);

end