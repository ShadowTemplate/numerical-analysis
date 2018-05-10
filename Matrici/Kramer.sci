function B = Kramer(A, b)
    // Risolve il sistema lineare di n equazioni in n incognite

    // Input:
    // A: matrice nxn, contenente i coefficienti delle incognite
    // b: vettore di termini noti
    
    [m,n] = size(A)
    if m ~= n then
        error('La matrice non è quadrata')
    end
    
    for i = 1 : n
        temp = A
        temp(:,i) = b 
        B(i)= det(temp)/det(A) 
    end
    
endfunction
