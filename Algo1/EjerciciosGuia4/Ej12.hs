raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = sucesionA n - 1 

sucesionA :: Integer -> Float
sucesionA 1 = 2
sucesionA n = 2 + 1/sucesionA (n-1)