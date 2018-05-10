function x = triangSup(A,b)
    // Risolve il sistema lineare triangolare superiore
    // con l'algoritmo di sostituzione all'indietro
    
    // Input: 
    // A: matrice di n righe triangolare superiore, contenente i coefficienti delle incognite
    // b: vettore dei termini noti
    
    n = length(b)
    x = zeros(n,1)
    
    for i = 1 : n
        if abs(A(i,i)) < 10e-15 then
            error('Matrice singolare')
        end
    end
    
    
    for i = n : -1 : 1
        s = 0
        for j = i + 1 : n
            s = s + A(i,j)*x(j)
        end
        x(i) = (b(i) - s)/A(i,i)
    end
    
    
endfunction
