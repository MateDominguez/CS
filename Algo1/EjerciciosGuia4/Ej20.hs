tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax n m
  | 1 <= n && n <= m = tomaValorMaxAux n m 0

tomaValorMaxAux :: Integer -> Integer -> Integer -> Integer
tomaValorMaxAux n m k
  | n == m = k
  | sumaDivisores n > k = tomaValorMaxAux (n+1) m (sumaDivisores n)
  | otherwise = tomaValorMaxAux (n+1) m k

sumaDivisores :: Integer -> Integer
sumaDivisores n = divisores n n

divisores :: Integer -> Integer -> Integer
divisores n 1 = 1
divisores n m
  | mod n m == 0 = m + divisores n (m-1)
  | otherwise = divisores n (m-1)