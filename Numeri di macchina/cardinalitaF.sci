function card=cardinalitaF(Beta, t, M1, M2)
    
    // Forma dei numeri: +/- d0,d1d2d3d4... * Beta^p 
    card = (Beta-1)*(Beta^t)*(M2-M1-1)*2+1    

    // (Beta-1): possibili scelte di d0
    // (Beta^t): possibili scelte delle cifre dopo la virgola (per ciascuna delle t cifre si può scegliere in Beta modi diversi)
    // (M2-M1-1): possibili valori assumibili da p
    // *2: numeri positivi e negativi
    // +1: aggiungere lo 0
    
endfunction
