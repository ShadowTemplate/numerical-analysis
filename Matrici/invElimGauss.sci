function X = invElimGauss(A)
    // Calcola X, inversa della matrice A
    // mediante l'algoritmo di eliminazione di Gauss applicato alla matrice estesa E = [ A|I ]
    // Al termine dell'algoritmo vengono risolti gli n sistemi lineari
    // Ea xi = Ei
    // Dove 
    // Ea è la matrice A dopo l'algoritmo
    // Ei è la i-esima colonna di I dopo l'algoritmo
    // xi è la colonna i-esima di X
    
    // N.B.: Non unisco materialmente A ed I
    
    [m,n] = size(A)
    if m ~=n then
        error('Matrice non quadrata')
    end
    
    Id = eye(n,n) 
    
    for k = 1 : n-1
        //calcolo mik
        for i = k+1 : n
            
            if abs(A(k,k)) < 1e-15  then
                error('Impossibile fattorizzare la matrice')
            end
            
            mik = -A(i,k)/A(k,k)
            
            for j = 1 : n //Si è scelto di iterare su tutte le colonne e non solo quelle da k+1 in poi (in modo da poter settare Id correttamente)
                A(i,j) = A(i,j) + mik*A(k,j)
                Id(i,j) = Id(i,j) + mik*Id(k,j)
            end
            
        end
    end
    
    for i = 1 : n
        xi = triangSup(A,Id(:,i))
        X(:,i) = xi
    end
 
endfunction
