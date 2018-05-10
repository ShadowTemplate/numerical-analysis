// Metodo di Newton
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

function [alpha,it] = newton(f, x0, tol, itmax)

    it = 0
    arresto = %F
    while(~arresto & it <= itmax)
        it = it+1
        x1=x0-f(x0)/f(x0, 1)
        err = abs(x1-x0)/(1+abs(x1))
        arresto = err < tol
        x0 = x1
    end
    
    alpha = x1
    
    if(~arresto) then
        warning('La precisione potrebbe non essere stata raggiunta e lo zero non essere trovato')
    end
    
endfunction
