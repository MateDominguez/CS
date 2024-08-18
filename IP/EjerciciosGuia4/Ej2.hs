parteEntera :: Float -> Float
parteEntera x
    | (x >= 0) && (x < 1) = 0  
    | x >= 0 = parteEntera (x-1) + 1
    | x < 0 = (parteEntera (x+1) - 1)