function s = norme_varie(x, p)
    [n1, n2] = size(x);

    if p == 1
        if (n1 == 1 || n2 == 1)
            s = sum(abs(x));
        else
            s = max(sum(abs(x), 1));
        end
    elseif p == 2
        if (n1 == 1 || n2 == 1)
            s = sqrt(sum(abs(x).^2));
        else
            e = eig(x'*x);
            s = sqrt(max(abs(e)));
        end
    elseif (p == 'Inf')
        if (n1 == 1 || n2 == 1)
            s = max(abs(x));
        else
            s = max(sum(abs(x), 2));
        end
    else
        error("Il parametro p è incorretto");
    end
end