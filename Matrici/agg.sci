function B = agg(A)
    //Restituisce l'aggiunta di A 
    
    [m, n] = size(A)
    
    for i = 1 : m
        for j = 1 : n
            B(j,i) = (-1)^(i+j) * det(A([1:i-1, i+1:m], [1:j-1, j+1:n]))            
        end
    end
endfunction
