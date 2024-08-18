f :: Int -> Int -> Int
f 1 m = g 1 m
f n m = g n m + f (n-1) m

g :: Int -> Int -> Int
g n 1 = n
g n m = n^m + g n (m-1)