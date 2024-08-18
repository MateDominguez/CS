ultimoDigito :: Int -> Int
ultimoDigito n = mod n 10

quitarUltimoDigito :: Int -> Int
quitarUltimoDigito n = div n 10

sumarDigitos :: Int -> Int
sumarDigitos n  | n < 10 = n
                | otherwise = ultimoDigito n + sumarDigitos (quitarUltimoDigito n)

todosIguales :: Int -> Bool
todosIguales n  | n < 10 = True
                | otherwise = compararTodos n (ultimoDigito n)

compararTodos :: Int -> Int -> Bool
compararTodos n m | n < 10 = n == m
                  | otherwise = (ultimoDigito n) == m && compararTodos (quitarUltimoDigito n) m