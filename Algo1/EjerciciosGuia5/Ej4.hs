--a)
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (y:[]) = [y]
sacarBlancosRepetidos (x:y:xs)
  | x == ' ' && y == ' ' = [y] ++ sacarBlancosRepetidos xs
  | otherwise = [x] ++ sacarBlancosRepetidos (y:xs)

--b)
contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras xs = 1 + contarEspacios xs 0

contarEspacios :: [Char] -> Integer -> Integer
contarEspacios [] n = n
contarEspacios (x:xs) n
  | x == ' ' = contarEspacios xs (n+1)
  | otherwise = contarEspacios xs n

--c)
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs) = (primerPalabra (x:xs)):palabras (eliminarPrimerPalabra (x:xs))

primerPalabra :: [Char] -> [Char]
primerPalabra [x] = [x]
primerPalabra (x:xs)
  | x /= ' ' = x:primerPalabra xs
  | otherwise = []

eliminarPrimerPalabra :: [Char] -> [Char]
eliminarPrimerPalabra [] = []
eliminarPrimerPalabra (x:xs)
  | x == ' ' = xs
  | otherwise = eliminarPrimerPalabra xs

--d)
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga (x:xs) = palabraMasLargaAux (palabras (x:xs))

palabraMasLargaAux :: [[Char]] -> [Char]
palabraMasLargaAux [x] = x
palabraMasLargaAux (x:y:xs)
  | contarCaracteres x >= contarCaracteres y = palabraMasLargaAux (x:xs)
  | contarCaracteres x < contarCaracteres y = palabraMasLargaAux (y:xs)

contarCaracteres :: [Char] -> Integer
contarCaracteres [] = 0
contarCaracteres (x:xs) = 1 + contarCaracteres xs

--e)
aplanar :: [[Char]] -> [Char]
aplanar [x] = x
aplanar (x:xs) = x ++ aplanar xs

--f)
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs

--g)
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = x ++ (nBlancos n) ++ aplanarConNBlancos xs n

nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos n = " " ++ nBlancos (n-1)