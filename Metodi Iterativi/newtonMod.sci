// Metodo di Newton modificato
//
// Dati input:
// f: funzione di cui ricercare lo zero (si assume continua)
// x0: punto di partenza
// tol: precisione richiesta
// itmax: numero massimo di iterate consentite
//
// Dati output:
// alpha: ~ zero di f
// it: iterate effettuate

function [alpha,it] = newtonMod(f, x0, tol, itmax)
    
    fprimo = f(x0, 1)
    x1 = x0-f(x0)/fprimo
    m = 1/fprimo
    
    [alpha, it] = dirCostante(f, x1, m, tol, itmax)
        
endfunction
