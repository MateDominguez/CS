{-¡Vamos Campeones!
En exactas se está jugando un torneo de fútbol y la facultad le pidió a los alumnos de IP programar algunas
funcionalidades en Haskell, Los datos con los que contamos para esto son los nombres de los equipos que participan
del torneo, los nombres de los arqueros titulares de cada uno de dichos equipos, y la cantidad de goles recibidos
por esos arqueros. Los nombres de los equipos y sus respectivos arqueros serán modelados mediante tuplas de tipo
(String, String), donde la primera componente representa el nombre del equipo, y la segunda representa el nombre
del arquero titular de dicho equipo.
En los problemas en los cuales se reciben como parámetros secuencias arquerosPorEquipo y goles, cada posición de
la lista goles representará la cantidad de goles recibidos por el arquero del equipo que se encuentra en esa misma
posicion de arquerosPorEquipo. Por ejemplo, si la lista arquerosPorEquipo es [("Sacachispas", "Neyder Aragon"),
("Fenix", "Nahuel Galardi")] y la lista de goleses [3, 5], eso indicaría que Neyder Aragon recibió 3 goles, y
Nahuel Galardi 5.-}

{-
1) Atajaron Suplentes
problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
	requiere: {equiposValidos(arquerosPorEquipo)
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
	asegura: {
	res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos.
	}
}
-}

atajaronSuplentes :: [(String, String)] -> [Int] -> Int -> Int
atajaronSuplentes _ g gt = gt - golesTitulares g

golesTitulares :: [Int] -> Int
golesTitulares [] = 0
golesTitulares (g:gs) = g + golesTitulares gs

{-
2) Equipos Válidos
problema equiposValidos (arquerosPorEquipo: seq<String X String>): Bool {
	requiere: {True}
	asegura: {
	(res = True) <=> arquerosPorEquipo no contiene nombres de clubes repetidos, ni arqueros repetidos, ni jugadores con nombre del club
	}
}
-}

equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = True
equiposValidos (x:xs)
  | not (clubRepetido x xs) && not (arqueroRepetido x xs) && not (jugadorConNombreDelClub x (x:xs))= equiposValidos xs
  | otherwise = False

clubRepetido :: (String, String) -> [(String, String)] -> Bool
clubRepetido _ [] = False
clubRepetido c (x:xs)
  | fst c == fst x = True
  | otherwise = clubRepetido c xs

arqueroRepetido :: (String, String) -> [(String, String)] -> Bool
arqueroRepetido _ [] = False
arqueroRepetido a (x:xs)
  | snd a == snd x = True
  | otherwise = arqueroRepetido a xs

jugadorConNombreDelClub :: (String, String) -> [(String, String)] -> Bool
jugadorConNombreDelClub _ [] = False
jugadorConNombreDelClub j (x:xs)
  | snd j == fst x = True
  | otherwise = jugadorConNombreDelClub j xs


{-
3) Porcentaje de goles
problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {
	res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares
	}
}
-}

porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeGoles a xs g = division (golesArquero a xs g) (golesTitulares g) 

golesArquero :: String -> [(String, String)] -> [Int] -> Int
golesArquero a (x:xs) (g:gs)
  | a == snd x = g
  | otherwise = golesArquero a xs gs

{-
golesTitulares :: [Int] -> Int
golesTitulares [] = 0
golesTitulares (g:gs) = g + golesTitulares gs
-}

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b


{-
4) Valla Menos Vencida
problema vallaMenosVencida (arquerosPorEquipo: seq<String X String>, goles: seq<Z>): String {
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {|goles| > 0}
	asegura: {
	res es alguno de los arqueros de arquerosPorEquipo que menor goles recibió de acuerdo a goles
	}
}
-}

vallaMenosVencida :: [(String, String)] -> [Int] -> String
vallaMenosVencida [x] _ = snd x
vallaMenosVencida (x:y:xs) (g1:g2:gs)
  | g1 < g2 = vallaMenosVencida (x:xs) (g1:gs)
  | otherwise = vallaMenosVencida (y:xs) (g2:gs)