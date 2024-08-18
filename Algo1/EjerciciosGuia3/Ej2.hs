--a)
absoluto :: Int -> Int
absoluto n = abs n

--b)
maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y 
    | x >= y = x 
    | otherwise = y

--c)
maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z = maximoAbsoluto x (maximoAbsoluto y z) 

--d)
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y 
    | x==0 = True 
    | y==0 = True 
    | otherwise = False

--e)
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | (x==0  && y==0) = True | otherwise = False

--f)
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y 
    | (x < 3 && y < 3) = True 
    | (x >= 3 && y >= 3 && x < 7 && y < 7) = True
    | (x > 7 && y > 7) = True
    | otherwise = False

--g)
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z
    | x==y = y + z
    | x==z = y + x
    | z==y = x + z
    | x==y && y==z = 0
    | otherwise = x + y + z

--h)
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y 
    | ((x >= 1 && y >= 1) && (mod x y == 0)) = True
    | otherwise = False

--i)
digitoUnidades :: Int -> Int
digitoUnidades x = mod (abs x) 10

--j)
digitoDecenas :: Int -> Int
digitoDecenas x = div (mod (abs x) 100) 10