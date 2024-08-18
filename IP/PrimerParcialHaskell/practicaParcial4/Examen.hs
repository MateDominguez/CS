--1)
golesDeNoGoleadores :: [(String, String)] -> [Int] -> Int -> Int
golesDeNoGoleadores [] [] 0 = 0
golesDeNoGoleadores e gg gt = gt - golesDeGoleadores gg

golesDeGoleadores :: [Int] -> Int
golesDeGoleadores [] = 0
golesDeGoleadores (x:xs) = x + golesDeGoleadores xs

--2)
equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = True
equiposValidos (x:xs)
  | not (clubRepetido x xs) && not (goleadorReptido x xs) && not (jugadorConNombreClub x (x:xs)) = True
  | otherwise = False

clubRepetido :: (String, String) -> [(String, String)] -> Bool
clubRepetido _ [] = False
clubRepetido c (x:xs)
  | fst c == fst x = True
  | otherwise = clubRepetido c xs

goleadorReptido :: (String, String) -> [(String, String)] -> Bool
goleadorReptido _ [] = False
goleadorReptido g (x:xs)
  | snd g == snd x = True
  | otherwise = goleadorReptido g xs

jugadorConNombreClub :: (String, String) -> [(String, String)] -> Bool
jugadorConNombreClub  _ [] = False
jugadorConNombreClub j (x:xs)
  | snd j == fst x = True
  | otherwise = jugadorConNombreClub j xs

--3)
porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeGoles _ [] [] = 0 
porcentajeDeGoles gr e gg = division (golesGoleador gr e gg) (golesDeGoleadores gg)

golesGoleador :: String -> [(String, String)] -> [Int] -> Int
golesGoleador _ [] [] = 0
golesGoleador gr (e:es) (g:gg)
  | gr == snd e = g
  | otherwise = golesGoleador gr es gg

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

{-
golesDeGoleadores :: [Int] -> Int
golesDeGoleadores [] = 0
golesDeGoleadores (x:xs) = x + golesDeGoleadores xs
-}

--4)
botinDeOro :: [(String, String)] -> [Int] -> String
botinDeOro [e] [g] = snd e
botinDeOro (e1:e2:es) (g1:g2:gt)
  | golesGoleador (snd e1) [e1] [g1] > golesGoleador (snd e2) [e2] [g2] = botinDeOro (e1:es) (g1:gt)
  | otherwise = botinDeOro (e2:es) (g2:gt)

{-
golesGoleador :: String -> [(String, String)] -> [Int] -> Int
golesGoleador _ [] [] = 0
golesGoleador gr (e:es) (g:gg)
  | gr == snd e = g
  | otherwise = golesGoleador gr es gg
-}