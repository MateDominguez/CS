esDivisible :: Int -> Int -> Bool
esDivisible x y 
  | x < y = False
  | x == y = True
  | otherwise = esDivisible (x - y) y