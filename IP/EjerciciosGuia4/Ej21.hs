pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras 0 n r = recorreQ 0 n r
pitagoras m n r = recorreQ m n r + pitagoras (m-1) n r

recorreQ :: Integer -> Integer -> Integer -> Integer
recorreQ m 0 r 
  | m^2 <= r^2 = 1
  | otherwise = 0
recorreQ m n r
  | m^2 + n^2 <= r^2 = 1 + recorreQ m (n-1) r
  | otherwise = recorreQ m (n-1) r