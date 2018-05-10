function [A1, b1] = changeRow(A, b, k)
    // Inverte la riga k-esima di A con una riga j > k
    // Prima dello scambio: A(k,k) = 0
    // Dopo lo scambio: A(k,k) ~= 0
    // Inverte la riga k-esima di b con la riga j-esima scelta precedentemente
    
    // ASSERT: nelle righe j-esime (j>k) c'è almeno un elemento diverso da 0
    
    [m,n] = size(A)
    
    m = k
    continua = %T

    while continua
        m = m + 1
        if abs(A(m,k)) >= 1e-15 then
            continua = %F
        end
    end
    
    A([k,m],:) = A([m,k],:)
    b([k,m],:) = b([m,k],:)
    
    A1 = A
    b1 = b
    
endfunction
