function interpola(f,a,b,n)
    // Disegna il grafico di f(x), del polinomio di interpolazione di Lagrange p(x)
    // e dell'errore R(x) tra f ed il polinomio
    // Il polinomio di Lagrange p interpola n nodi (appartengono al dominio di f).
    // I nodi hanno ascisse equidistanti tra a e b
    
    // Input:
    // f: funziona originale (da confrontare col polinomio di interpolazione p)
    // a <-> b: intervallo per le ascisse dei nodi
    // n: numero di nodi
    
    // Output:
    // Grafici delle funzioni
    
    // Definizione dei nodi
    x = linspace(a,b,n)
    y = f(x)
    
    // Punti in cui disegnare i grafici
    t = linspace(a,b,1000)
    
    ft = f(t) // f
    p = lagrange(x,y,t) // polinomio di interpolazione
    
    Rt = abs(ft-p)
    clf
    subplot(2,1,1)
    plot(t,ft,'b', t, p, 'g')
    subplot(2,1,2)
    plot(t, Rt)
    
    //Es: interpola(f, 0, %pi, 3)

endfunction
