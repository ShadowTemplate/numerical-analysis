function d = Laplace(A)
    // Calcolo del determinante di una matrice mediante la regola di Laplace
    
    // Input:
    // A: matrice quadrata di cui calcolare il determinante
    
    // Output:
    // d: determinante
    
    [m,n] = size(A)
    if m ~= n then
        error('La matrice non è quadrata')
    end
    
    if n==1 then
        d=A(1,1)
    else
        d=0
        for j = 1:n
            A1j= A(2:n, [1:j-1, j+1:n])
            d = d + (-1)^(j+1)*A(1,j)*Laplace(A1j)
        end
    end
endfunction
