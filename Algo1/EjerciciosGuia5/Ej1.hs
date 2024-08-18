--1)
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)

--2)
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo (xs)

--3) no se si hice lo que pide, no entiendo la especificacion
principio :: [t] -> [t] 
principio [x] = [x]
principio (x:xs) = [x]

--4)
reverso :: [t] -> [t]
reverso [x] = [x]
reverso (x:xs) = reverso (xs) ++ [x]