--a)
prodInt :: (Float, Float) -> (Float, Float) -> (Float, Float)
prodInt (a,b) (c,d) = (a*c,b*d)

--b)
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor x y = fst(x)<fst(y) && snd(x)<snd(y)

--c)
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1,y1) (x2,y2) = sqrt((x2-x1)^2 + (y2-y1)^2)

--d)
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (x,y,z) = x+y+z

--e)
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (x,y,z) w 
    | (mod (abs(x)) (abs(w)) == 0) &&  (mod (abs(y)) (abs(w)) == 0) && (mod (abs(z)) (abs(w)) == 0) = x+y+z
    | (mod (abs(x)) (abs(w)) == 0) &&  (mod (abs(y)) (abs(w)) == 0) = x+y
    | (mod (abs(x)) (abs(w)) == 0) &&  (mod (abs(z)) (abs(w)) == 0) = x+z
    | (mod (abs(y)) (abs(w)) == 0) &&  (mod (abs(z)) (abs(w)) == 0) = y+z
    | (mod (abs(x)) (abs(w)) == 0) = x
    | (mod (abs(y)) (abs(w)) == 0) = y
    | (mod (abs(z)) (abs(w)) == 0) = z


--f)
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (x,y,z) 
    | mod (abs(x)) 2 == 0 = 0
    | mod (abs(y)) 2 == 0 = 1
    | mod (abs(z)) 2 == 0 = 2
    | otherwise = 4

--g)
crearPar :: a -> b -> (a,b)
crearPar a b = (a,b)

--h)
invertir :: (a,b) -> (b,a)
invertir (a,b) = (b,a)