function v = FsetRat(Beta, t, M1, M2)

    x = FsetReal(Beta, t, M1, M2)
    [n,d] = rat(x,1e-15)
    
    v = []
    
    for i = 1 : length(x)
        temp = string(n(i)) + "/" + string(d(i))
        v = [v temp]
    end
endfunction
