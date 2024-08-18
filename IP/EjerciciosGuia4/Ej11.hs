--a)
eAprox :: Integer -> Float 
eAprox 0 = 1
eAprox n =  1/((factorial n)) + eAprox (n-1)

factorial :: Integer -> Float
factorial 0 = 1
factorial 1 = 1
factorial n = fromIntegral n*factorial (n-1)

--b)
e :: Float
e = eAprox 10