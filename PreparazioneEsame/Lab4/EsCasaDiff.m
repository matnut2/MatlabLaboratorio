function EsCasaDiff
    clear all;
    clc;
    
    % DATI
    e = 1;
    d = 1;
    NR = 1000;
    
    x0 = 1;
    toll = 10^(-8);
    max_iter = 10^5;
    
    phi=@(x) -2*log10( (e/3.51*d) + 2.52*x/NR );
    [solF, xvF, stepF] = puntofisso (phi, x0, toll, max_iter);

    % ---- statistiche ----
    fprintf('\n \t soluzione : %1.15e',solF);
    fprintf('\n \t iterazioni : %8.0f',stepF);
    fprintf('\n \t abs(x-g(x)), iterata n-1: %1.1e',abs(xvF(end-1)-phi(xvF(end-1))));
    fprintf('\n \t abs(x-g(x)), ultima iter: %1.1e',abs(xvF(end)-phi(xvF(end))));
    fprintf('\n \n');

    f = @(x) -2*log10( (e/3.51*d) + 2.52*x/NR ) - x;
    Df = @(x) - (1+2/log(10)*(2.52/NR)/((e/3.51*d) + 2.52*x/NR));
    [solN,xvN,stepN] = newton(f,Df,x0,toll,max_iter);
    
    % ---- statistiche ----
    fprintf('\n \t soluzione : %1.15e',solN);
    fprintf('\n \t iterazioni : %8.0f',stepN);
    fprintf('\n \t abs(x-g(x)), iterata n-1: %1.1e',abs(xvN(end-1)-phi(xvN(end-1))));
    fprintf('\n \t abs(x-g(x)), ultima iter: %1.1e',abs(xvN(end)-phi(xvN(end))));
    fprintf('\n \n');
end