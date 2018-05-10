function y = polinomiale(x, A)
    // Calcola il valore della funzione 
    // y = a0 + a1*x + a2*x^2 + ... + an*x^n
    // nel punto x  
    
    // Input:
    // A: vettore dei coefficienti a0, a1, ... an
    
    // Output
    // y = a0 + a1*x + a2*x^2 + ... + an*x^n
    
    y = 0
    for i = 1 : length(A)
        y = y + A(i)*x^(i-1)
    end
endfunction
