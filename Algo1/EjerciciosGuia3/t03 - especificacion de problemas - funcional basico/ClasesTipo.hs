triple :: (Num t) => t -> t
triple x = 3*x
  
maximo :: (Ord t) => t -> t -> t
maximo x y | x >= y = x
           | otherwise = y
             
distintos :: (Eq t) => t -> t -> Bool
distintos x y = x /= y
  
-- Cantidad de raices de la ecuación: ax^2 + bx + c
cantidadDeSoluciones :: (Num t, Ord t) => t -> t -> t-> Int
cantidadDeSoluciones a b c | discriminante > 0 = 2
                           | discriminante == 0 = 1
                           | otherwise = 0
                           where discriminante = b^2 - 4*a*c
  
pepe :: (Floating t, Eq t, Num u, Eq u) => t -> t -> u -> Bool
pepe x y z = sqrt (x + y) == x && 3*z == 0
