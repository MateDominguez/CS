iesimoDigito :: Int -> Int -> Int
iesimoDigito n i
    | n == 0 = 0
    | otherwise = div (mod n (10^i)) (10^(i-1))