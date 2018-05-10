function tester()
    
    while %T
        //genera una matrice random
        
        s1 = ceil(rand()*10) * ceil(rand()*10)
        s2 = ceil(rand()*10) * ceil(rand()*10)
        A = rand(s1, s2) * ceil(rand()*ceil(rand()*10))
        B = ridScaliniMaxPivotParz(A)
        if rank(A) ~= rank(B) then
            disp('FUNCTION FAIL')
        end
    end
    
endfunction
