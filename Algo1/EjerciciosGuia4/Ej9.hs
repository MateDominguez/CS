esCapicua :: Int -> Bool
esCapicua n 
    | n < 10 = True
    | (mod (cantidadDigitos n) 2 == 0) && (div (mod n (10^cantidadDigitos n)) (10^(cantidadDigitos n - 1))) == (div (mod n (10^2)) (10^(1))) = True

cantidadDigitos :: Integer -> Integer
cantidadDigitos n
    | n < 10 = 1
    |otherwise = 1 + cantidadDigitos (div n 10)

--no funciona