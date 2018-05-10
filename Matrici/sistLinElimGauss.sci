function x = sistLinElimGauss(A, b)
    // Risolve il sistema lineare Ax=b mediante l'algoritmo di eliminazione di Gauss
    // Trasforma la matrice A in una triangolare superiore U e b in y
    // Risolve infine Ux=y
    
    [m,n] = size(A)
    if m ~=n then
        error('Matrice non quadrata')
    end
    
    for k = 1 : n-1
        //calcolo mik
        for i = k + 1 : n
            
            if abs(A(k,k)) < 1e-15  then
                error('Impossibile fattorizzare la matrice')
            end
            
            mik = -A(i,k)/A(k,k)
            
            for j = k + 1 : n
                A(i,j) = A(i,j) + mik*A(k,j)
            end
            
            b(i) = b(i) + mik*b(k)
        end
    end
    
    U = triu(A)
    x = triangSup(U, b)    

endfunction
