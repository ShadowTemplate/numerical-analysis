function [A1, b1] = maxPivot(A, b, k)
    // Scambia in A e in b la riga k-esima con la riga j-esima (j>k) tale che sia massimo abs(A(j,k))
    
    j = k
    currMax = abs(A(k,k))
    
    [m, n] = size(A)
    
    for i = k + 1 : m
        if abs(A(i,k)) > currMax then
            currMax = abs(A(i,k))
            j = i
        end
    end
    
    A([k,j],:)=A([j,k],:)
    b([k,j],:)=b([j,k],:)
    
    A1=A
    b1=b
    
endfunction
