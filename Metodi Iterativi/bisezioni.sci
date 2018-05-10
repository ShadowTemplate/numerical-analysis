// Algoritmo delle successive bisezioni
//
// Dati input:
// f: funzione di cui ricercare lo zero (si assume continua)
// a, b: estremi dell'intervallo di definizione di f
// tol: precisione richiesta
//
// Dati output:
// alpha: ~ zero di f
// it: numero di iterate

function [alpha, it] = bisezioni(f, a, b, tol)

    fa = f(a)
    fb = f(b)

    if (fa*fb > 0) then
        error('La funzione non cambia segno nell''intervallo')
    end
    
    nmax = ceil(log2((b-a)/tol))
    for n = 1: nmax
        c = ((a+b)/2)
        fc = f(c)
        if (fc == 0) then
            alpha = c
            return
        elseif (fa*fc < 0)
            b = c
        else
            a = c
            fa = fc
        end
    end
    
    alpha = c
    it = nmax

endfunction
