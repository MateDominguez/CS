--a)
menorDivisor :: Integer -> Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorDesde 2 n 

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n m 
    | n == m = m
    | mod m n == 0 = n
    | otherwise = menorDivisorDesde (n+1) m

--b)
esPrimo :: Integer -> Bool
esPrimo n 
    | n == 1 = False
    | menorDivisor n == n = True
    | otherwise = False

--c)
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos 1 _ = True
sonCoprimos _ 1 = True
sonCoprimos n m
    | maximoComunDivisor n m == 1 = True
    | otherwise = False

maximoComunDivisor :: Integer -> Integer -> Integer
maximoComunDivisor n 0 = n
maximoComunDivisor n m = maximoComunDivisor m (mod n m)

--d)
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 2 0

nEsimoPrimoAux :: Integer -> Integer -> Integer -> Integer
nEsimoPrimoAux n i k 
    | n == k = i-1
    | esPrimo i = nEsimoPrimoAux n (i+1) (k+1)
    | otherwise = nEsimoPrimoAux n (i+1) k