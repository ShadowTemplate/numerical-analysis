function y=f1(x, ord)
    if (argn(2)==1) then
        ord = 0
    end

    if (ord==0) then
        y=x-cos(x)
    else if (ord==1) then
            y = 1+sin(x)
        else if (ord==2) then
                y = cos(x)
            else 
                error('Derivata non calcolabile')
            end
        end
    end

endfunction
