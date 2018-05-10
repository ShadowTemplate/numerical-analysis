function f = zeroColumn(A, currX, currY)
    // Restituisce %T se tutti gli elementi della matrice A 
    // al di sotto dell'elemento A(currX, currY) sono nulli (incluso A(currX, currY))
    // %F altrimenti
    
    f = %T
    
    [m, n] = size(A)
    
    for i = currX : m
        if abs(A(i, currY)) >= 1e-15  then // se non è 0
            f = %F
        end
    end
    
endfunction
