function t = interpol2(x, y, s)
    % Inizializzo l'array con le valutazioni
    t = zeros(size(s));

    % Vettore colonna contenente tutti i l_i(s(j))
    L=zeros(length(x),1);

    for j = 1:length(s)
        for i = 1:length(x)
            L(i) = (prod(s(j)-x(1:i-1))*prod(s(j)-x(i+1:end)))/(prod(x(i)-x(1:i-1))*...
            prod(x(i)-x(i+1:end)));
        end
    end
end