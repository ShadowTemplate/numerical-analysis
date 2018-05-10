function stampaPolinomio(C)
    // Input:
    // C: vettore dei coefficienti a0, a1, ... an del polinomio
    
    // Output:
    // Stampa a video del polinomio
    // y = a0 + a1*x + ... + an*x^n
    
    n = length(C)
    
    disp('Polinomio interpolante:')
    pol = 'y = '

    for i = 1 : n - 1
        if abs(C(i)) >= 1e-15 then

            if i == 1 then
                pol = pol + string(C(i)) + ' '
            end
            if i == 2 then
                pol = pol + string(C(i)) + '*x '
            end
            if i > 2 then
                pol = pol + string(C(i)) + '*x^' + string(i-1) + ' '
            end

            if abs(C(i+1)) >= 1e-15 & C(i+1) > 0 then
                pol = pol + ' +'
            end
        end
    end
    
    if abs(C(n)) >= 1e-15 then
        if n == 1 then
            pol = pol + string(C(n)) 
        end
        if n == 2 then
            pol = pol + string(C(n)) + '*x' 
        end
        if n > 2 then
            pol = pol + string(C(n)) + '*x^' + string(n-1) 
        end
    end
    
    if length(C) == 1 & abs(C(1)) < 1e-15 then
        pol = pol + string(0)
    end

    disp(pol)
    
endfunction
