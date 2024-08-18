module Simulacro where
--problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
--  requiere: {True}
--  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
--}
--1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales. 

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs)
    | not (tuplasRepetidas (x:xs)) && not (componentesIguales (x:xs)) = True
    | otherwise = False

tuplasRepetidas :: [(String, String)] -> Bool 
tuplasRepetidas [] = False
tuplasRepetidas (x:[]) = False
tuplasRepetidas ((p1,p2):xs)
    | pertenece xs (p1,p2) || pertenece xs (p2,p1) = True
    | otherwise = tuplasRepetidas xs
  
componentesIguales :: [(String, String)] -> Bool
componentesIguales [] = False
componentesIguales ((p1,p2):xs)
    | p1 == p2 = True
    | otherwise = componentesIguales xs

{-
pertenece :: (Eq t) => [t] -> t -> Bool
pertenece [] _ = False
pertenece (x:xs) n
    | x == n = True
    | otherwise = pertenece xs n 
-}

--problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
--  requiere: {relacionesValidas(relaciones)}
--  asegura: {res no tiene elementos repetidos}
--  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
--}

personas :: [(String, String)] -> [String]
personas [] = []
personas (x:xs)
    | relacionesValidas (x:xs) = eliminaRepetidos (listaElementos (x:xs))

listaElementos :: [(String, String)] -> [String]
listaElementos [] = []
listaElementos (x:xs) = (fst x):(snd x):[] ++ listaElementos xs

eliminaRepetidos :: [String] -> [String]
eliminaRepetidos [] = []
eliminaRepetidos (x:[]) = [x]
eliminaRepetidos (x:xs)
    |  pertenece xs x = eliminaRepetidos (x:(elimina xs x))
    | not (pertenece xs x) = x:[] ++ eliminaRepetidos xs

pertenece :: (Eq t) => [t] -> t -> Bool
pertenece [] _ = False
pertenece (x:xs) n
    | x == n = True
    | otherwise = pertenece xs n

elimina :: [String] -> String -> [String]
elimina [] _ = []
elimina (x:xs) n
    | x == n = xs
    | otherwise = [x] ++ elimina xs n

----------------------

--problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
--  requiere: {relacionesValidas(relaciones)}
--  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
--}

amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe p (x:xs)
  | fst x == p || snd x == p = (fst x):(snd x):[] ++ amigosDe p xs
  | otherwise = amigosDe p xs

--problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
--  requiere: {relaciones no vacía}
--  requiere: {relacionesValidas(relaciones)}
--  asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
--}

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos (x:xs) = personaConMasAmigosAux (listaElementos (x:xs))

personaConMasAmigosAux :: [String] -> String
personaConMasAmigosAux [x] = x
personaConMasAmigosAux (x:y:xs)
  | (aparicionesN x (x:y:xs)) >= (aparicionesN y (x:y:xs)) = personaConMasAmigosAux (x:xs)
  | (aparicionesN x (x:y:xs)) < (aparicionesN y (x:y:xs)) = personaConMasAmigosAux  (y:xs)

aparicionesN :: String -> [String] -> Integer
aparicionesN n [] = 0
aparicionesN n (x:xs)
  | n == x = 1 + aparicionesN n xs
  | otherwise = aparicionesN n xs