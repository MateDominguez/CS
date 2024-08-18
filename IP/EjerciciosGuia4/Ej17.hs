esFibonacci :: Integer -> Bool
esFibonacci n 
  | esFibonacciAux n (n+10) == 1 = True
  | otherwise = False


esFibonacciAux :: Integer -> Integer -> Integer
esFibonacciAux n m 
  | m < 0 = 0
  | fibonacci m == n = 1
  | otherwise = esFibonacciAux n (m-1)


fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)