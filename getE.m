function sol= getE(M,e)
    if (-pi < M < 0) | (M > pi)
        E = M - e;
    else
        E = M + e;
    end
    check = 1;
    while check > 10e-10
        E_new = (E + (M - E + e * sin(E))/(1 - e * cos(E)));
        check = abs(E_new - E);
        E = E_new;
    end
    sol=E;
end