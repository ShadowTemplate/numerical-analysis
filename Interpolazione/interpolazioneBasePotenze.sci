function interpolBasePotenze(A,B,p)
    // Calcola il polinomio di interpolazione nei punti (Ai;Bi)
    // e lo visualizza a schermo
    
    // Input:
    // A: vettore delle ascisse dei nodi
    // B: vettore delle ordinate dei nodi
    // p: numero di punti in cui disegnare il grafico
    // N.B.: i punti saranno equidistanti tra le ascisse dei nodi più piccolo e più grande
    
    // Output:
    // Grafico della funzione
    
    if size(A, 'c') < 1 | size(B, 'c') < 1 then
        error('Inserire almeno un nodo.')
    end
    
    if size(A, 'c') ~= size(B,'c') then
        error('I vettori delle coordinate devono avere stessa lunghezza.')
    end
    
    if size(A,'r') ~= 1 | size(B,'r') ~= 1 then
        error('Inserire vettori-riga per le coordinate dei punti (non colonna)')    
    end
    
    if p < size(A, 'c') then
        warning('Aumentare numero di punti da disegnare')
    end

    disp('Elenco nodi:')
    for i = 1 : size(A, 'c')
        str = '(' + string(A(1,i)) + '; ' + string(B(1,i)) + ')'
        disp(str)
    end
    
    C = coeffVand(A, B)
    x = linspace(min(A), max(A), p)
    clf
    plot(x, polinomiale(x, C))
    
// Es: interpolBasePotenze([0 2 1 5 7 3 9 4 8 6], [2 10 7 3 6 9 8 2 8 4], 10000)
    
endfunction
