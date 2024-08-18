esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n 
  | esSumaInicialDePrimosAux n n == 0 = False
  | esSumaInicialDePrimosAux n n == 1 = True

esSumaInicialDePrimosAux :: Integer -> Integer -> Integer
esSumaInicialDePrimosAux 0 _ = 0
esSumaInicialDePrimosAux _ 0 = 0
esSumaInicialDePrimosAux n m
  | sumaDePrimos m == n = 1
  | otherwise = esSumaInicialDePrimosAux n (m-1)

sumaDePrimos :: Integer -> Integer
sumaDePrimos 0 = 0
sumaDePrimos n = nEsimoPrimo n + sumaDePrimos (n-1)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 2 0

nEsimoPrimoAux :: Integer -> Integer -> Integer -> Integer
nEsimoPrimoAux n i k 
    | n == k = i-1
    | esPrimo i = nEsimoPrimoAux n (i+1) (k+1)
    | otherwise = nEsimoPrimoAux n (i+1) k

esPrimo :: Integer -> Bool
esPrimo n 
    | n == 1 = False
    | menorDivisor n == n = True
    | otherwise = False

menorDivisor :: Integer -> Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorDesde 2 n 

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n m 
    | n == m = m
    | mod m n == 0 = n
    | otherwise = menorDivisorDesde (n+1) m