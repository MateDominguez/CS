sumaImpares :: Int -> Int
sumaImpares n 
  | n == 1 = 1 
  | otherwise = (2*n - 1) + sumaImpares (n-1)