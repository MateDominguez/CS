sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias 0 _ _ = 0
sumaPotencias q n m = potencias q n * potencias q m

potencias :: Integer -> Integer -> Integer
potencias q 1 = q
potencias q n = q^n + potencias q (n-1)