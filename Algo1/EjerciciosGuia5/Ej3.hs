--1)
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--2)
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

--3)
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
                | otherwise = maximo (y:xs)

--4)
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = [x+n] ++ sumarN n xs

--5)
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)

--6)
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = reverso (sumarElPrimero (reverso (x:xs)))

reverso :: [t] -> [t]
reverso [x] = [x]
reverso (x:xs) = reverso (xs) ++ [x]

--7)
pares :: [Integer] -> [Integer] 
pares [] = []
pares (x:xs)
  | mod x 2 == 0 = [x] ++ pares xs
  | otherwise = pares xs

--8)
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)
  | mod x n == 0 = [x] ++ multiplosDeN n xs
  | otherwise = multiplosDeN n xs

--9)
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = ordenar (quitar (maximo (x:xs)) (x:xs)) ++ [maximo (x:xs)]

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar x (y:xs) 
  | not (pertenece x (y:xs)) = (y:xs)
  | pertenece x (y:xs) && x == y = (xs)
  | otherwise = [y] ++ quitar x xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece r (t:ts) = r == t || pertenece r (ts)