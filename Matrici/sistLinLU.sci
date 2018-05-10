function x = sistLinLU(A, b)
    // Risolve il sistema lineare Ax=b mediante la fattorizzazione LU di A

    [L,U] = fattLU(A)
    y = triangInf(L,b)
    x = triangSup(U,y)
    
endfunction
