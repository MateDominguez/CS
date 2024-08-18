todosDigitosIguales :: Int -> Bool
todosDigitosIguales n
    | calculoDigitosIguales n == 0 = False
    | calculoDigitosIguales n == 1 = True

calculoDigitosIguales :: Int -> Int
calculoDigitosIguales n
        | div n 10 == 0 = n
        | mod n 10 == div (mod n 100) 10 = calculoDigitosIguales (div n 10)
        | otherwise = 0