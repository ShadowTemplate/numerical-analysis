function x = sistLinElimGaussMPV(A, b)
    // Risolve il sistema lineare Ax=b mediante l'algoritmo di eliminazione di Gauss con tecnica del massimo pivot parziale
    // Trasforma la matrice A in una triangolare superiore U e b in y
    // Risolve infine Ux=y
    
    [m,n] = size(A)
    if m ~=n then
        error('Matrice non quadrata')
    end
    
    if abs(det(A)) < 1e-15 then
        error('Matrice singolare')
    end
    
    for k = 1 : n-1
        
        [A, b] = maxPivot(A, b, k)
            
        for i = k + 1 : n
            
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
