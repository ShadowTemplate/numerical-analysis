function v = FsetReal(Beta, t, M1, M2)
    // Generatore di numeri di macchina (insieme F)
    
    // Input
    // Beta: base
    // t: cifre significative dopo la virgola
    // M1 <-> M2: range per l'esponente
    
    // Output
    // v: vettore dei numeri di macchina
    
    // L'algoritmo di generazione segue questi passi
    // 1) Creazione dei numeri nella forma normalizzata SOMMATORIA[i=0:t] ( d_i * Beta^(-i) )
    // (vengono cioè generati i numeri "di base", senza considerare il coefficiente moltiplicativo Beta^p
    // N.B.: I numeri vengono manipolati come stringhe, secondo successive concatenazioni
    // 2) Le stringhe vengono convertite in numeri
    // 3) Ogni numero generato viene moltiplicato per tutte le potenze della base nel range in input
    // 4) Si generano ed aggiungono i numeri negativi e lo zero.
    
    if ~checkFInput(Beta, t, M1, M2) then
        error('Errore nei dati di input')
    end
    
    disp("La cardinalità di F è: ")
    disp(cardinalitaF(Beta, t, M1, M2))
    
    // Memorizzo le cifre che potranno essere presenti dopo la virgola (sotto forma di stringa)
    digits = [] // Vettore di numeri da 0 a Beta-1 (es: Beta = 2; digits = [0, 1])
    for i = 1 : Beta
        digits = [digits, string(i-1)]
    end

    // I numeri di macchina potranno cominciare una cifra di digits, eccetto lo 0 (la prima cifra deve essere >= 1)
    v = digits([2:Beta]) //Memorizzo in v tutti gli elementi di digits eccetto il primo
    
    for i = 1 : Beta-1 // Ad ogni elemento di v
        v(i)= v(i) + '.' // concateno il punto alla cifra
    end
    
    for i = 1 : t // Per ogni cifra decimale
        
        len = size(v, 'c') // Memorizzo il numero di elementi di v: numero di colonne (v è un vettore-riga) // 'c' = column
        
        ris = [] // Vettore di supporto (qui verranno salvati tutti i numeri generati)
        
        for j = 1 : len // Per ogni elemento del vettore (la dimensione di v cresce ad ogni iterata di t)
            temp = v(j) // Prendo l'elemento corrente
            
            // Devo concatenare all'elemento corrente tutte le possibili cifre di digits
            // Per farlo devo "replicare" l'elemento temp un numero di volte pari alla dimensione di digits ( = Beta)

            work = [] // Vettore di supporto: conterrà tanti elementi tutti uguali a temp (elemento corrente del vettore)
            
            for k = 1 : Beta
                work = [work, temp] // Aggiungo un elemento temp
                work(k) = work(k) + digits(k) // e gli concateno la k-esima cifra
            end
                    
            ris = [ris, work] // Aggiorno il risultato
        end
        
        v = ris // Trasferisco il risultato da ris a v
    
    end
    
    v = strtod(v) // Converto le stringhe di v in double
    
    mult = [] // Memorizzo l'elenco dei moltiplicatori (saranno tutti i Beta^p, M1 < p < M2)
    
    for i = M1+1 : M2-1
        mult = [mult, Beta^i]
    end
    
    len = size(v, 'c')
    ris = [] // Vettore di supporto (qui verranno salvati tutti i numeri moltiplicati per Beta^p)
    
    // Moltiplico ogni elemento di v per ogni elemento di mult, con un procedimento analogo al precedente
    for i = 1 : len // Per ogni elemento di v
        temp = v(i) // i-esimo elemento da moltiplicare
        
        work = [] // Vettore di supporto
        
        for j = 1 : length(mult)
            work = [work, temp]
            work(j) = work(j) * mult(j)
        end
        
        ris = [ris, work]
    end
    
    v = [ris, 0, ris*-1] // L'insieme dei numeri di macchina sarà costituito da tutti gli elementi computati, i loro opposti e lo 0
    v = gsort(v, 'g', 'i') // Ordino in modo crescente (quick sort su tutti gli elementi)

endfunction
