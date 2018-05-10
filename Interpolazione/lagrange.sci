function p = lagrange(x,y,t)
    // Valutazioni del polinomio interpolante di Lagrange nei punti t
    // Il polinomio interpolante passa per i nodi (xi;yi)
    
    // Input: 
    // x: vettore delle ascisse dei nodi
    // y: vettore delle ordinate dei nodi
    // t: vettore dei punti in cui valutare il polinomio
    
    // Output:
    // p: vettore delle valutazioni del polinomio nei punti t
    
    n = length(x)
    p = 0
    for k = 1 : n
        Lk = 1
        for i = [1:k-1,k+1:n]
            Lk = Lk.*(t-x(i))/(x(k)-x(i))
        end
        p = p + y(k) * Lk
    end
    
endfunction
