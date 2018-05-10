function flag = checkFInput(Beta, t, M1, M2)
    
    // Controllo che tutti i parametri ∈ Z
    temp = [Beta t M1 M2]
    for i = 1 : length(temp)
        if temp(i) ~= floor(temp(i)) then
            disp("E'' stato inserito un parametro non intero')
            flag = %F
            return
        end
    end
    
    
    // Controlli standard
    if Beta <= 1 then
        disp('La base deve essere > 1')
        flag = %F
        return
    end
    
    if t < 0 then
        disp('t deve essere >= 0")
        flag = %F
        return
    end
    
    if M1 >= 0 then
        disp('M1 deve essere < 0')
        flag = %F
        return
    end
    
    if M2 <= 0 then
        disp('M2 deve essere > 0')
        flag = %F
        return
    end
    
    // Controlli aggiuntivi    
    maximum = Beta^(M2-1)*(Beta-Beta^-t)
    if maximum > number_properties("huge") then // number_properties("huge"): 2^1023*(2-2^-52)
        disp('Il calcolatore non può rappresentare max(F)')
        flag = %F
        return
    end
    
    minimum = Beta^(M1+1)
    if minimum < number_properties("tiny") then // number_properties("tiny"): 2^-1022
        disp('Il calcolatore non può rappresentare min(F)')
        flag = %F
        return 
    end
        
    if Beta ~= 2 then
        warning('I numeri generati potrebbero subire arrotondamenti')
    end
    
    flag = %T
    return 
endfunction
