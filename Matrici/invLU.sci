function X = invLU(A)
    // Calcola X, inversa della matrice A
    
    // Viene calcolata la fattorizzazione LU di A
    // Vengono risolti gli n sistemi lineari
    // { L yi = ei
    // { U xi = yi
    // Dove 
    // ei è la colonna i-esima di I
    // yi un vettore di supporto
    // xi è la i-esima colonna di X
    
    [m,n] = size(A)
    if m ~=n then
        error('Matrice non quadrata')
    end
    
    Id = eye(n,n)
    
    // Gli n sistemi lineari condividono la matrice dei coeffienti:
    // calcolo una sola volta la fattorizzazione LU
    [L,U] = fattLU(A)
  
    for i = 1 : n
        yi = triangInf (L, Id(:,i) )
        xi = triangSup (U,yi)
        X(:,i) = xi
    end
    
endfunction
