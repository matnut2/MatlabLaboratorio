clear all;
clc;

% DATI
f = @(x) 1./(1+25*(x.^(2)));
nmax = 25;
s = linspace(-1, 1, 1000);

ff = f(s);

for n = 1:nmax
    % Definizione dei nodi
    xe = linspace(-1, 1, n+1);
    xcl = -cos([1:n]*pi/n);

    % Valutazione di f nei nodi
    ye = f(xe);
    ycl = f(xcl);
    te = interpol(xe,ye,s);
    tcl = interpol(xcl,ycl,s);

    % Calcolo dell'errore massimo di interpolazione
    ee(n) = max(abs(te - ff));
    ecl(n) = max(abs(tcl-ff));
end

% PLOT
figure(1);
hold on;
semilogy(ee, '-or');
semilogy(ecl, '-ob');
title("Andamento dell'errore massimo all'aumentare dei nodi di interpolazione")
legend("errore equispaziati", "errore Chenyshev-Lobatto");
xlabel("n");
ylabel("errore max");