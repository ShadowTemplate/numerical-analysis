// Algoritmo delle successive bisezioni (ricorsivo)
//
// Dati input:
// f: funzione di cui ricercare lo zero (si assume continua)
// a, b: estremi dell'intervallo di definizione di f
// tol: precisione richiesta
//
// Dati output:
// alpha: ~ zero di f

function alpha = bisezioni(f, a, b, tol)

    fa = f(a)
    fb = f(b)

    if (fa*fb > 0) then
        error('La funzione non cambia segno nell''intervallo')
    end

    c = ((a+b)/2)
    fc = f(c)
    if (fc == 0) then
        alpha = c
        return
    end

    if ((b-a) >= tol) then
        if (fa*fc < 0) then
            alpha = bisezioni(f,a,c,tol)
        else
            alpha = bisezioni(f,c,b,tol)
        end
    else
        alpha = c // alpha = a // alpha = b
    end

endfunction
