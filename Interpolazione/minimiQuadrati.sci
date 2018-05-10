function C = minimiQuadrati(g, A, B)
    // Input:
    // g: grado del polinomio di interpolazione
    // A: vettore delle ascisse dei nodi
    // B: vettore delle ordinate dei nodi

    // Output:
    // C: vettore dei coefficienti a0, a1, ... an del polinomio che 
    // interpola i nodi (secondo la base delle potenze)
    // y = a0 + a1*x + a2*x^2 + ... + an*x^n
    
    rowNumber = length(A)
    colNumber = g + 1

    V = ones(rowNumber, colNumber) //Matrice dei coefficienti
    for i = 1 : rowNumber
        for j = 2 : colNumber //La prima colonna è costituita da 1
            V(i,j)=A(i)^(j-1)
        end
    end
    
    C = sistLinElimGaussPivot(V'*V,V'*B')

    stampaPolinomio(C)
    
endfunction
