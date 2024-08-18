--1)
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [x] = [x]
sumaAcumulada (x:y:xs) = x:sumaAcumulada ((y+x):xs)

--2)
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs)
  | esPrimo x = [x]:descomponerEnPrimos xs
  | otherwise = (descomponerEnPrimosAux x 1):descomponerEnPrimos xs

descomponerEnPrimosAux :: Integer -> Integer -> [Integer]
descomponerEnPrimosAux x i
  | x == nEsimoPrimo i = [x]
  | mod x (nEsimoPrimo i) == 0 = (nEsimoPrimo i):descomponerEnPrimosAux (div x (nEsimoPrimo i)) i
  | otherwise = descomponerEnPrimosAux x (i+1)

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

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 2 0

nEsimoPrimoAux :: Integer -> Integer -> Integer -> Integer
nEsimoPrimoAux n i k 
    | n == k = i-1
    | esPrimo i = nEsimoPrimoAux n (i+1) (k+1)
    | otherwise = nEsimoPrimoAux n (i+1) k