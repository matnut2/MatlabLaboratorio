function t=interpol(x,y,s)
% Input:
%         x,y  vettori di ascisse cui si associa il polinomio interpolatore "p_n"
%         s    vettore di ascisse in cui valutare il polinomio interpolatore
% Output:
%         t    vettore di valutazioni "p_n(s)"

m=length(x)-1;
coeff=polyfit(x,y,m);
t=polyval(coeff,s);

end