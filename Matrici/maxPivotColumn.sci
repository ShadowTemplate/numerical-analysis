function A = maxPivotColumn (A, currX, currY)
    // Scambia in A la riga currX-esima con la riga j-esima (j>currX) tale che sia massimo abs(A(j,currY))
    
    [m, n] = size(A)
    
    j = currX // conserverà l'indice della riga del massimo corrente
    currMax = abs(A(currX,currY))
    
    for i = currX + 1 : m
        if abs(A(i,currY)) > currMax then
            currMax = abs(A(i,currY))
            j = i
        end
    end
    
    //effettuo lo scambio di righe
    A([currX,j],:)=A([j,currX],:)
    
endfunction
