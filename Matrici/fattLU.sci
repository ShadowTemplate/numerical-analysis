function [L,U] = fattLU(A)
    //Calcola la fattorizzazione LU di una matrice
    
    [m,n] = size(A)
    if m ~=n then
        error('Matrice non quadrata')
    end
    
    L = eye(m,n)
    for k = 1 : n-1
        //calcolo mik
        for i = k+1 : n
            
            if abs(A(k,k)) < 1e-15  then
                error('La fattorizzazione LU non esiste')
            end
            
            mik = -A(i,k)/A(k,k)
            L(i,k)=-mik
            
            for j = k+1 : n //for j = 1 : n  permetterebbe dopo di fare U = A
                A(i,j) = A(i,j) + mik*A(k,j)
            end
        end
    end
    
    U = triu(A)
    
endfunction
