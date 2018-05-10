// Metodo delle secanti
//
// Dati input:
// f: funzione di cui ricercare lo zero (si assume continua)
// x0: primo punto di partenza
// x1: secondo punto di partenza
// tol: precisione richiesta
// itmax: numero massimo di iterate consentite
//
// Dati output:
// alpha: ~ zero di f
// it: iterate effettuate

function [alpha,it] = secanti(f, x0, x1, tol, itmax)
    
    it = 0
    arresto = %F

    fx0=f(x0)
    fx1=f(x1)
    
    while(~arresto & it <= itmax)
        it = it+1
        x2=x1-fx1/((fx1-fx0)/(x1-x0))
        err = abs(x2-x1)/(1+abs(x2))
        arresto = err < tol
        x0 = x1
        x1 = x2
        fx0=fx1
        fx1=f(x1)
    end
    
    alpha = x2
    
    if(~arresto) then
        warning('La precisione potrebbe non essere stata raggiunta e lo zero non essere trovato')
    end
    
endfunction
