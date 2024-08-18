module Solucion where
import Data.Char

-- Nombre de grupo: {Discipulos de Curry}
-- Integrante1: { 46019684,Noli Villar Agustin Fernando}
-- Integrante2: { 45481940,Dominguez Mateo Felipe}
-- Integrante3: { 96081392,Sequera Villadales Jose Enrrique}
-- Integrante4: { 95824812,Salamanca Rumbos Edgar Miguel}

--Parte I: Cifrado Cesar

-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula letra = (ord letra) >= 97 && (ord letra) <= 122

-- EJ 2
letraANatural :: Char -> Int
letraANatural letra = (ord letra) - 97

-- EJ 3
desplazar :: Char -> Int -> Char
desplazar letra numero 
  | esMinuscula letra == False = letra
  | desplazo > 122 = desplazar letra (numero - 26)
  | desplazo < 97 = desplazar letra (numero + 26)
  | otherwise = chr (desplazo)
  where desplazo = (ord letra) + numero

-- EJ 4
cifrar :: String -> Int -> String
cifrar [] numero = []
cifrar (letra:restoDePalabra) numero = (desplazar letra numero):(cifrar restoDePalabra numero)

-- EJ 5
descifrar :: String -> Int -> String
descifrar [] numero = []
descifrar (letra:restoDePalabra) numero = (desplazar letra (-numero)):(descifrar restoDePalabra numero)

-- EJ 6
--llama a la funcion auxiliar
cifrarLista :: [String] -> [String]
cifrarLista [] = []
cifrarLista palabras = cifrarListaAux palabras 0 ((elementosLista palabras) - 1)

--recibe la lista de palabras, la posicion inicial y y la ultima posicion de la lista. Por cada palabra en la lista, la cifra usando n = posicion en la lista. Cuando la posicion en la lista es la ultima, corta la recursion
cifrarListaAux :: [String] -> Int -> Int -> [String]
cifrarListaAux [] _ _ = []
cifrarListaAux (palabra:palabras) posicionLista ultimaPosicion
  | posicionLista == ultimaPosicion = [cifrar palabra posicionLista]
  | otherwise = (cifrar palabra posicionLista):cifrarListaAux palabras (posicionLista + 1) ultimaPosicion

-- EJ 7
--llama a la funcion auxilar. Si la lista es vacia devuelve la lista de 26 elementos todos 0
frecuencia :: String -> [Float]
frecuencia [] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
frecuencia palabra = frecuenciaAux (eliminaMayusculas palabra) 97 122

--recibe la palabra sin mayusculas, el 97 como indice inicial (a) y el 122 como indice final (z). Divide la cantidad de apariciones de la letra por la cantidad de letras de la palabra y lo multiplica por 100 para obtener el porcentaje. Cuando indice es el indice final, corta la recursion
frecuenciaAux :: String -> Int -> Int -> [Float]
frecuenciaAux [] _ _ = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
frecuenciaAux palabra asciiActual asciiFinalZ
  | asciiActual == asciiFinalZ = [(division (aparicionesElementoEnLista palabra (chr asciiActual)) (elementosLista palabra) * 100)]
  | otherwise = ((division (aparicionesElementoEnLista palabra (chr asciiActual)) (elementosLista palabra)) * 100):frecuenciaAux palabra (asciiActual + 1) asciiFinalZ

-- Ej 8
--devuelve el par ordenado (letra mas frencuente desplazada n posiciones, frecuencia de letra mas frecuente)
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente palabra numero = (desplazar (chr (indiceLetraMasFrecuente (frecuencia palabra) + 97 )) numero , frecuenciaLetraMasFrecuente (frecuencia palabra))

--recibe la lista de frecuencias de la palabra y, comparando el valor de las frecuencias, elimina todas las que son menores o iguales a la mayor, devuelve la mayor
frecuenciaLetraMasFrecuente :: [Float] -> Float
frecuenciaLetraMasFrecuente [frecuencia] = frecuencia
frecuenciaLetraMasFrecuente (frecuencia1:frecuencia2:frecuencias)
  | frecuencia1 >= frecuencia2 = frecuenciaLetraMasFrecuente (frecuencia1:frecuencias)
  | otherwise = frecuenciaLetraMasFrecuente (frecuencia2:frecuencias)

--recibe la lista de frecuencias de la palabra. Recorre la lista comparando las frecuencias con la frecuencia de la letra mas frecuente hasta encontrarla, cuando lo hace, devuelve su posicion en la lista
indiceLetraMasFrecuente :: [Float] -> Int
indiceLetraMasFrecuente (frecuencia:frecuencias)
  | frecuencia == frecuenciaLetraMasFrecuente(frecuencia:frecuencias) = 0
  | otherwise = 1 + indiceLetraMasFrecuente(frecuencias)

-- EJ 9
--recibe 2 palabras. Determina si la 2da palabra es un cifrado posible de la 1ra palabra
esDescifrado :: String -> String -> Bool
esDescifrado palabra1 palabra2 = elem palabra2 (cifradosPosibles palabra1 0 25)

--recibe una palabra. Arma una lista con todos los cifrados posibles con n entre 0 y 25
cifradosPosibles :: String -> Int -> Int -> [String]
cifradosPosibles palabra a z
  | a == z = [cifrar palabra a]
  | otherwise = (cifrar palabra a):cifradosPosibles palabra (a + 1) z

-- EJ 10
--verifica si la primera palabra de la lista no posee minúsculas (usando la función noTieneMinusculas), devolviendo una tupla con ese elemento en caso de ser afirmativo ya que esa palabra es un descifrado consiga misma con cualquier n, seguido de una llamada recursiva con la misma función y con la misma lista pero sin ese primer elemento. En caso contrario, llama a la función auxilar pasándole como parámetro la lista de palabras, luego se llama a sí misma pero sacándole la primera palabra a la lista, así hasta que la lista se vacíe. Hay dos casos especiales: si se ingresa como parámetro de entrada una lista vacía, la función devuelve una lista vacía; si tras vaciar casi toda la lista hasta que quede un solo elemento, y éste sí posee minusculas, la función acaba, devolviendo como último elemento una lista vacía ya que al quedar una sola palabra (con minúsculas) ésta no tiene con quien compararse.
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados [] = []
todosLosDescifrados (palabra: palabras) | noTieneMinusculas palabra = (palabra, palabra): todosLosDescifrados palabras
                                        | palabras == [] = []
                                        | otherwise = todosLosDescifradosAux (palabra: palabras) ++ todosLosDescifrados (head palabras: tail palabras)

--recibe una lista de palabras, si la primera palabra es un descifrado de la siguiente palabra, agrega al par a una lista y se vuelve a llamar a sí misma eliminando la palabra analizada. Devuelve una lista de pares ordenados tales que el primer elemento es la palabra comparada y los segundos elementos son las palabras que son cifrados de la primera 
todosLosDescifradosAux :: [String] -> [(String, String)]
todosLosDescifradosAux [] = []
todosLosDescifradosAux [palabra] = []
todosLosDescifradosAux (palabra: palabras)
  | esDescifrado palabra (head palabras) = (palabra, head palabras):(head palabras, palabra): todosLosDescifradosAux (palabra: tail palabras)
  | otherwise = todosLosDescifradosAux (palabra: tail palabras)

noTieneMinusculas :: String -> Bool
noTieneMinusculas [] = True
noTieneMinusculas (letra: restoDePalabra) | esMinuscula letra = False
                                          | otherwise = noTieneMinusculas (restoDePalabra)

--Parte II: Codigo Vigenere

-- EJ 11
--llamo a una función auxiliar con los mismos parámetros, solo que añado devuelta la clave, 
--en la función auxiliar, voy añadiendo letra por letra del string de clave a una lista vacía y descontando el número
--que indica cuantas veces se debe repetir, cuando el string de clave se vacía, llamo devuelta a la función y pongo la clave
--que está guardada e intacta, así hasta que el numero llegue a 0

expandirClave :: String -> Int -> String
expandirClave clave numero = expandirClaveAux clave numero clave

expandirClaveAux :: String -> Int -> String -> String
expandirClaveAux _ 0 _ = []
expandirClaveAux clave numero claveIntacta 
  | clave == [] = expandirClaveAux claveIntacta numero claveIntacta
  | otherwise = (head clave):(expandirClaveAux (tail clave) (numero-1) claveIntacta)

-- EJ 12
--llamo a una función auxiliar en la que pongo como parámetros a la palabra que quiero descifrar  y a la clave expandida a la misma
--longitud de la palabra, en esta función auxiliar llamo a la función desplazar en cada letra del string en conjunto con el número que le
--corresponde a la letra de la misma posición de la clave (convertida usando la función letraANatural)

cifrarVigenere :: String -> String -> String
cifrarVigenere palabra clave = cifrarVigenereAux palabra (expandirClave clave (elementosLista palabra))

cifrarVigenereAux :: String -> String -> String
cifrarVigenereAux [] _ = []
cifrarVigenereAux palabra clave = (desplazar (head palabra) (letraANatural (head clave))):(cifrarVigenereAux (tail palabra) (tail clave))

-- EJ 13
--es lo mismo que en el anterior, nada más que cuando llamo a desplazar, el número que le doy como parámetro es el opuesto al que le corresponde
--con la función letraANatural

descifrarVigenere :: String -> String -> String
descifrarVigenere palabra clave = descifrarVigenereAux palabra (expandirClave clave (elementosLista palabra))

descifrarVigenereAux :: String -> String -> String
descifrarVigenereAux [] _ = []
descifrarVigenereAux palabra clave = (desplazar (head palabra) (-letraANatural (head clave))):(descifrarVigenereAux (tail palabra) (tail clave))

-- EJ 14
--la función longitudEntrePalabras hace lo que pide la sumatoria de la consigna: le das una palabra y la misma palabra descifrada con una clave,
--luego le calculas el valor absoluto de la resta entre el valor que le da letraANatural de la primera letra de la plabra y el valor que le da 
--letraANatural de la palabra descifrada. Y  vas sumando el resultado de cada posición.

--en peorCifrado llamas a una función auxiliar con la palabra, con una tupla que ya tiene la longitud entre la palabra y la palabra descifrada
--con la primera clave de la lista de claves, junto con la lista de claves sin la primera. En la función auxiliar, llamó a
--longitudEntrePalabras con la palabra y con la misma palabra descifrada con cada clave de la lista, y para cada resultado que me da lo comparo
--con el resultado de la tupla que me había guardado como parámetro, en caso de ser menor, este mismo valor y la clave se pasan como nuevo
--parámetro, así recorriendo todas las claves hasta que esta lista quede vacía, entonces devuelve el segundo valor de la tupla
--con la clave cuya longitudEntrePalabras fue la menor de todas

peorCifrado :: String -> [String] -> String
peorCifrado palabra claves = peorCifradoAux palabra (tail claves) (distanciaEntrePalaraYClave,head (claves))
                             where distanciaEntrePalaraYClave = longitudEntrePalabras palabra (cifrarVigenere palabra (head claves))

peorCifradoAux :: String -> [String] -> (Int,String) -> String
peorCifradoAux palabra [] (menorLongitud,claveGanadora) = claveGanadora
peorCifradoAux palabra claves (menorLongitud,claveGanadora) 
  | distanciaEntrePalaraYClave <= menorLongitud = peorCifradoAux palabra (tail claves) (distanciaEntrePalaraYClave,head(claves))
  |otherwise = peorCifradoAux palabra (tail claves) (menorLongitud,claveGanadora)
  where distanciaEntrePalaraYClave = longitudEntrePalabras palabra (cifrarVigenere palabra (head claves))

longitudEntrePalabras:: String -> String -> Int
longitudEntrePalabras [] [] = 0
longitudEntrePalabras palabra clave = (valorAsoluto(letraANatural (head palabra) - letraANatural (head clave))) + (longitudEntrePalabras (tail palabra) (tail clave))

-- EJ 15
--llamo a una función auxiliar con los mismos parámetros que se les da a combinacionesVigenere en conjunto con la lista de claves devuelta, 
--este parámetro en la función auxiliar siempre va a quedar intacto, en la función auxiliar con el primer elemento de la lista de palabras
--le hago el cifrado vigenere con cada elemento de las claves y veo si es igual a la palabra cifrada, en caso de serlo lo guardo en una tupla en conjunto
--con la clave. cuando la lista de claves se vacía llamo a la función con el tail de la lista de palabras y "relleno" la lista de claves con la lista
--de claves intactas y se repite el proceso hasta que la lista de palabras esté vacía, en ese caso devuelve una lista con todas las tuplas generadas

combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere palabras claves cifrado = combinacionesVigenereAux palabras claves claves cifrado

combinacionesVigenereAux :: [String] -> [String] -> [String] -> String -> [(String, String)]
combinacionesVigenereAux [] _ _ _ = []
combinacionesVigenereAux palabras [] clavesIntactas cifrado = combinacionesVigenereAux (tail palabras) clavesIntactas clavesIntactas cifrado
combinacionesVigenereAux palabras claves clavesIntactas cifrado 
  | cifrarVigenere (head palabras) (head claves) == cifrado = (head palabras, head claves):(combinacionesVigenereAux palabras (tail claves) clavesIntactas cifrado)
  | otherwise = combinacionesVigenereAux palabras (tail claves) clavesIntactas cifrado

--funciones auxiliares
eliminaMayusculas :: String -> String
eliminaMayusculas [] = []
eliminaMayusculas (x:xs)
  | esMinuscula x = x:eliminaMayusculas xs
  | otherwise = eliminaMayusculas xs

elementosLista :: [t] -> Int
elementosLista [] = 0
elementosLista (x:xs) = 1 + elementosLista xs 

aparicionesElementoEnLista :: (Eq t) => [t] -> t -> Int
aparicionesElementoEnLista [] _ = 0
aparicionesElementoEnLista (x:xs) k
  | k == x = 1 + aparicionesElementoEnLista xs k
  | otherwise = aparicionesElementoEnLista xs k

division :: Int -> Int -> Float
division n m = fromIntegral n / fromIntegral m

valorAsoluto :: Int -> Int
valorAsoluto n 
  | n < 0 = -n
  | otherwise = n
