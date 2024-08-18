import Test.HUnit

pares :: [Int] -> [Int]
pares [] = []
pares (x:xs)
  | mod x 2 == 0 && not (partenece xs x) = [x] ++ pares xs
  | otherwise = pares xs

partenece :: [Int] -> Int -> Bool
partenece [] _ = False
partenece (x:xs) n
  | n == x = True
  | otherwise = partenece xs n

test = [
  -- en realidad vale cualquier permutacion de los pares asi que si 
  -- bien estos resultados esperados cumplen con la especificacion, no cubre todos los casos validos
  "lista vacia" ~: (pares []) ~?= [],
  "solo pares sin repetir" ~: (pares [2,4,6]) ~?= [2,4,6],
  "solo pares repetidos" ~: (pares [2,2,6]) ~?= [2,6],
  "todos impares" ~: (pares [1,3,7]) ~?= [],
  "pares e impares" ~: (pares [1,3,2]) ~?= [2]
  ]