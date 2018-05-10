function X = ridScaliniMaxPivotParz(A)
    // Calcola X, matrice A ridotta a scalini
    
    // currX e currY indicano le "coordinate" correnti del pivot
	// (1,1) è il primo elemento della matrice (in alto a sinistra)
	
    currX = 1 // currRow
    currY = 1 // currColumn
    
    [rows, columns] = size(A)
    
    while currX <= rows & currY <= columns // Fin quando il pivot non si trova nell'ultimo elemento (in basso a destra) della matrice
        // N.B.: si è usato <= invece che ~= perchè le coordinate del pivot potrebbero "superare" le dimensioni della matrice
        // Es: pivot corrente in (penultima riga, ultima colonna), con elemento (ultima riga, ultima colonna) = 0.
        // In tal caso l'algoritmo lo farà muovere diagonalmente verso il basso. Nuove coordinate pivot (ultima riga, ultima colonna + 1)
        
        if zeroColumn(A, currX, currY) then // Se dal pivot (incluso) in giù ci sono tutti 0
            currY = currY + 1 // mi sposto a destra del pivot
        else 
            if abs(A(currX, currY)) >= 1e-15 & zeroColumn(A, currX + 1, currY) then // Se il pivot è ~=0 e gli elementi sottostanti sono nulli
                currX = currX + 1 // mi sposto diagonalmente in basso a destra
                currY = currY + 1
            else // Bisogna applicare l'algoritmo di eliminazione di Gauss
                A = maxPivotColumn (A, currX, currY) // Ricerco il massimo pivot nella colonna del pivot e scambio le righe 
                // N.B.: sicuramente ci sarà un elemento diverso da 0, per via del controllo precedente su zeroColumn
                
                // Attenzione: se nella colonna corrente dal pivot (incluso) all'ultimo elemento vi era solo un numero diverso da zero, 
                // dopo lo scambio tale numero diventerà pivot e sotto di lui vi saranno solo 0
                // in tal caso è inutile procedere con l'algoritmo di eliminazione di Gauss
                // si può già spostare il pivot in diagonalmente in basso a destra
                
                // Controllo se, dopo lo scambio, nelle righe sotto al pivot vi siano solo 0 (caso appena spiegato)
                if ~zeroColumn(A, currX + 1, currY) then // se c'è almeno un elemento ~= 0 procedo con l'algoritmo di eliminazione di Gauss
                    // Per ogni riga calcolo il moltiplicatore
                    for i = currX + 1 : rows
                        mik = -A(i,currY)/A(currX,currY)
                        
                        // Aggiorno la riga
                        for j = currY : columns
                            A(i,j) = A(i,j) + mik*A(currX,j)
                        end
                    end          
                end
                
                // Lo spostamento diagonalmente in basso a sinistra viene effettuato a prescindere dall'esecuzione o meno dell'algoritmo di elim. di Gauss
                currX = currX + 1
                currY = currY + 1
            end                  
        end    
    end
    
    X = A
    
endfunction
