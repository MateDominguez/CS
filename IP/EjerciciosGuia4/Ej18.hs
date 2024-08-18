mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n
  | n < 10 && esPar n = n
  | n < 10 = -1
  | otherwise = mayorDigitoParAux n (cantidadDigitos n) (-1)

mayorDigitoParAux :: Integer -> Integer -> Integer -> Integer
mayorDigitoParAux n i k
  | i == 0 = k
  | esPar (iesimoDigito n i) && iesimoDigito n i > k = mayorDigitoParAux n (i-1) (iesimoDigito n i)
  | otherwise = mayorDigitoParAux n (i-1) k

--funciones de calculo

cantidadDigitos :: Integer -> Integer
cantidadDigitos n
    | n < 10 = 1
    |otherwise = 1 + cantidadDigitos (div n 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
    | n == 0 = 0
    | i <= cantidadDigitos n = div (mod n (10^i)) (10^(i-1))

esPar :: Integer -> Bool
esPar n 
  | mod n 2 == 0 = True
  | otherwise = False