function demo_quadratura
    clear all;
    clc;

    f = @(x) 1/(1+x);
    a = 0; b = 1;

    trapezi = ((b-a)/2)*(f(a)+f(b));
    simpson = ((b-a)/6)*(f(a) + 4*f((a+b)/2)+f(b));

    errt = abs(trapezi - log(2));
    errs = abs(simpson - log(2));

    fprintf("\t [Err. Trapezi]: \t%1.4e\n", errt);
    fprintf("\t [Err. Simpson]: \t%1.4e\n", errs);

end