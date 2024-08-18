--1)
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece r (t:ts) = r == t || pertenece r (ts)

--2)
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs) = x == y && todosIguales (y:xs)

--3)
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) 
  | pertenece x xs = False
  | otherwise = todosDistintos xs

--4)
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) 
  | pertenece x xs = True
  | otherwise = hayRepetidos xs

--5)
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar x (y:xs) 
  | not (pertenece x (y:xs)) = (y:xs)
  | pertenece x (y:xs) && x == y = (xs)
  | otherwise = [y] ++ quitar x xs

--6)
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos x xs
  | not (pertenece x xs) = xs
  | otherwise = quitarTodos x (quitar x xs)

--7)
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:xs)
  | hayRepetidos (x:xs) = [x] ++ eliminarRepetidos (quitarTodos x (x:xs))
  | otherwise = (x:xs)

--8)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos (x:xs) (y:ys) 
  | elementosEnComun (eliminarRepetidos (x:xs)) (eliminarRepetidos (y:ys)) == eliminarRepetidos (x:xs) && elementosEnComun (eliminarRepetidos (x:xs)) (eliminarRepetidos (y:ys)) == eliminarRepetidos (y:ys)= True
  | otherwise = False

elementosEnComun :: (Eq t) => [t] -> [t] -> [t]
elementosEnComun _ [] = []
elementosEnComun [] _ = []
elementosEnComun (x:xs) (y:ys)
  | pertenece x (y:ys) = [x] ++ elementosEnComun xs (y:ys)
  | otherwise = elementosEnComun xs (y:ys)

--9)
capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua xs = xs == reverso xs

reverso :: [t] -> [t]
reverso [x] = [x]
reverso (x:xs) = reverso (xs) ++ [x]