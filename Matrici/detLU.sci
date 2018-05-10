function d = detLU(A)
    // Calcolo del determinante di una matrice mediante la fattorizzazione LU
    
    // Input:
    // A: matrice di cui calcolare il determinante
    
    // Ouputput:
    // d: determinante della matrice
    
    [m,n] = size(A)
    if m ~=n then
        error('Matrice non quadrata')
    end
    
    [L,U] = fattLU(A)
    
    d = 1
    // d è il prodotto degli elementi sulla diagonale di U
    for i = 1 : n
        d = d*U(i,i)
    end

endfunction
