function C = coeffVand(A, B)
    // A: vettore delle ascisse dei nodi
    // B: vettore delle ordinate dei nodi

    // C: vettore dei coefficienti del polinomio che interpola i nodi (secondo la base delle potenze)
    // a0 + a1*x + a2*x^2 + ... + an*x^n

    n = length(A)
    V = ones(n,n) // Matrice di Vandermonde
    for i = 1 : n
        for j = 2 : n // La prima colonna è costituita da 1
            V(i,j)=A(i)^(j-1)
        end
    end

    //disp('Matrice di Vandermonde generata:')
    //disp(V)

    C = sistLinElimGaussPivot(V,B)

    stampaPolinomio(C)

endfunction
