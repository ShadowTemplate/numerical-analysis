function x = triangInf(A,b)
    // Risolve il sistema lineare triangolare inferiore
    // con l'algoritmo di sostituzione in avanti
    
    // Input: 
    // A: matrice di n righe triangolare inferiore, contenente i coefficienti delle incognite
    // b: vettore dei termini noti
    
    n = length(b)
    x = zeros(n,1)
    
    for i = 1 : n
        if abs(A(i,i)) < 10e-15 then
            error('Matrice singolare')
        end
    end
    
    
    for i = 1 : n
        s = 0
        for j = 1 : i - 1
            s = s + A(i,j)*x(j)
        end
        x(i) = (b(i) - s)/A(i,i)
    end
    
    
endfunction
