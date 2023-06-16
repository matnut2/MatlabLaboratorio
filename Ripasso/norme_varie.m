function x = norme_varie(A, p)

[n1, n2] = size(A);

    if p == 1
        if n1 == 1 || n2 == 1
            x = sum(abs(A));
        else
            x = max(sum(abs(A), 1));
        end
    elseif p == 2
        if n1 == 1 || n2 == 1
            x = sqrt(sum(abs(A).^2));
        else
            e = eig(A'*A);
            x = max(abs(e));
        end
    elseif p == 'Inf'
        if n1 == 1 || n2 == 1
            x = max(abs(A));
        else
            x = max(sum(abs(A), 2));
        end
    end
end