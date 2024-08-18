sumaRacionales :: Integer -> Integer -> Float 
sumaRacionales 1 m = racional 1 m
sumaRacionales n m = racional n m + sumaRacionales (n-1) m

racional :: Integer -> Integer -> Float
racional n 1 = fromIntegral n
racional n m = (fromIntegral n)/(fromIntegral m) + racional n (m-1)