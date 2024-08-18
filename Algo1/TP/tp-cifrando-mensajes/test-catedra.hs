import Test.HUnit
import Solucion
import Data.List
-- No está permitido agregar nuevos imports.

runCatedraTests = runTestTT allTests

allTests = test [
    "esMinuscula" ~: testsEjesMinuscula,
    "letraANatural" ~: testsEjletraANatural,
    "desplazar" ~: testsEjdesplazar,
    "cifrar" ~: testsEjcifrar,
    "descifrar" ~: testsEjdescifrar,
    "cifrarLista" ~: testsEjcifrarLista,
    "frecuencia" ~: testsEjfrecuencia,
    "cifradoMasFrecuente" ~: testsEjcifradoMasFrecuente,
    "esDescifrado" ~: testsEjesDescifrado,
    "todosLosDescifrados" ~: testsEjtodosLosDescifrados,
    "expandirClave" ~: testsEjexpandirClave,
    "cifrarVigenere" ~: testsEjcifrarVigenere,
    "descifrarVigenere" ~: testsEjdescifrarVigenere,
    "peorCifrado" ~: testsEjpeorCifrado,
    "combinacionesVigenere" ~: testsEjcombinacionesVigenere
    ]


testsEjesMinuscula = test [
    "letraMinusculaVocal" ~: esMinuscula 'a' ~?= True,
    "letraMayusculaVocal" ~: esMinuscula 'A' ~?= False,
    "letraMinusculaConsonante" ~: esMinuscula 'b' ~?= True,
    "letraMayusculaConsonante" ~: esMinuscula 'B' ~?= False,
    "noEsLetra" ~: esMinuscula '@' ~?= False,
    "espacio" ~: esMinuscula ' ' ~?= False,
    "numero" ~: esMinuscula '1' ~?= False
    ]

testsEjletraANatural = test [
    "primeraLetraMinuscula" ~: letraANatural 'a' ~?= 0,
    "segundaLetraMinuscula" ~: letraANatural 'b' ~?= 1,
    "terceraLetraMinuscula" ~: letraANatural 'c' ~?= 2,
    "ultimaLetraMinuscula" ~: letraANatural 'z' ~?= 25
    ]

testsEjdesplazar = test [
    "letraMinuscula, n=0" ~: desplazar 'a' 0 ~?= 'a',
    "letraMinusculaSinRotacion+" ~: desplazar 'b' 2 ~?= 'd',
    "letraMinusculaConRotacion+" ~: desplazar 'z' 1 ~?= 'a',
    "letraMinusculaSinRotacion-" ~: desplazar 'd' (-2) ~?= 'b',
    "letraMinusculaConRotacion-" ~: desplazar 'a' (-1) ~?= 'z',
    "numero" ~: desplazar '1' 2 ~?= '1',
    "espacio" ~: desplazar ' ' 2 ~?= ' ',
    "letraMayuscula" ~: desplazar 'M' (-4) ~?= 'M'
    ]

testsEjcifrar = test [
    "Vacio" ~: cifrar "" 1 ~?= "",
    "palabraSinMinusculas" ~: cifrar "HOLA!" 3 ~?= "HOLA!",
    "palabraConMinusculas, n=0" ~: cifrar "Adios!" 0 ~?= "Adios!",
    "palabraConMinusculas, n>0" ~: cifrar "Computacion." 3 ~?= "Crpsxwdflrq.",
    "palabraConEspacio" ~: cifrar "hola mundo" 1 ~?= "ipmb nvoep",
    "espacio" ~: cifrar " " 5 ~?= " "
    ]

testsEjdescifrar = test [
    "Vacio" ~: descifrar "" 1 ~?= "",
    "palabraSinMinusculas" ~: descifrar "HOLA!" 3 ~?= "HOLA!",
    "palabraConMinusculas, n=0" ~: descifrar "Adios!" 0 ~?= "Adios!",
    "palabraConMinusculas, n>0" ~: descifrar "Crpsxwdflrq." 3 ~?= "Computacion.",
    "palabraConEspacio" ~: descifrar "ipmb nvoep" 1 ~?= "hola mundo",
    "espacio" ~: cifrar " " 5 ~?= " "
    ]

testsEjcifrarLista = test [
    "listaVacia" ~: cifrarLista [] ~?= [],
    "listaConUnaPalabra" ~: cifrarLista ["cpu"] ~?= ["cpu"],
    "listaConPalabrasYListaVacia" ~: cifrarLista ["Hola", "", "Mundo!"] ~?= ["Hola", "", "Mwpfq!"],
    "ListaVariasPalabras" ~: cifrarLista ["compu", "labo", "intro"] ~?= ["compu", "mbcp", "kpvtq"]
    ]

testsEjfrecuencia = test [
    "vacio" ~: frecuencia "" ~?= [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "unaMinuscula" ~: expectlistProximity (frecuencia "a") [100.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "variasMinusculas" ~: expectlistProximity (frecuencia "taller") [16.666668,0.0,0.0,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,16.666668,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0],
    "sinMinusculas" ~: frecuencia "ABC? !" ~?= [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "alfabetoMinusculasCompleto" ~: expectlistProximity (frecuencia "abcdefghijklmnopqrstuvwxyz") [3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154]
    ]

testsEjcifradoMasFrecuente = test [
    "soloUnaLetraMinuscula" ~: cifradoMasFrecuente "a" 1 ~?= ('b', 100.0),
    "variasletrasYUnaMinuscula" ~: cifradoMasFrecuente "ABCa" 2 ~?= ('c', 100.0),
    "variasLetrasYVariasMinusculas" ~: expectAnyTuplaAprox (cifradoMasFrecuente "DEFabb" 1) [('c', 66.666667)],
    "variasLetrasYVariasMinusculas" ~: expectAnyTuplaAprox (cifradoMasFrecuente "COMpu" 1) [('q', 50.0), ('v', 50.0)],
    "mismaMinusculaRepetida" ~: cifradoMasFrecuente "aaaaa" 3 ~?= ('d', 100.0)
    ]

testsEjesDescifrado = test [
    "ambosVacios" ~: esDescifrado [] [] ~?= True,
    "diferentes" ~: esDescifrado "taller" "compu" ~?= False,
    "cifrado(s1)=s2" ~: esDescifrado "taller" "ubmmfs" ~?= True
    ]

testsEjtodosLosDescifrados = test [
    "Vacio" ~: todosLosDescifrados [] ~?= [],
    "un elemento, minusculas" ~: todosLosDescifrados ["compu"] ~?= [],
    "un elemento, mayusculas" ~: todosLosDescifrados ["COMPU"] ~?= [("COMPU", "COMPU")],
    "un elemento, minusculas y mayusculas" ~: todosLosDescifrados ["On"] ~?= [],
    "varios elementos al azar, minusculas" ~: todosLosDescifrados ["uno", "dos", "tres"] ~?= [],
    "varios elementos al azar, mayusculas" ~: expectPermutacion (todosLosDescifrados ["UNO", "DOS", "TRES"]) [("UNO", "UNO"), ("DOS", "DOS"), ("TRES", "TRES")],
    "varios elementos al azar, minusculas y mayusculas" ~: todosLosDescifrados ["Uno", "dOS", "TreS"] ~?= [],
    "un elemento con un cifrado, minusculas" ~: expectPermutacion (todosLosDescifrados ["ab", "bc", "pan"]) [("ab", "bc"),("bc", "ab")],
    "un elemento con un cifrado, minusculas y mayusculas" ~: expectPermutacion (todosLosDescifrados ["aB", "bB", "agua"]) [("aB", "bB"),("bB", "aB")],
    "un elemento con varios cifrados, minusculas" ~: expectPermutacion (todosLosDescifrados ["ab", "bc", "cd", "sal"]) [("ab", "bc"), ("bc", "ab"), ("ab", "cd"), ("cd", "ab"), ("bc", "cd"), ("cd", "bc")],
    "un elemento con varios cifrados, minusculas y mayusculas" ~: expectPermutacion (todosLosDescifrados ["Ab", "Ac", "Ad", "sal"]) [("Ab", "Ac"), ("Ac", "Ab"), ("Ab", "Ad"), ("Ad", "Ab"), ("Ac", "Ad"), ("Ad", "Ac")],
    " varios elementos con su cifrado" ~: expectPermutacion (todosLosDescifrados ["ab", "Fp", "OO", "bc", "Fi", "ik", "oo"]) [("ab", "bc"),("bc", "ab"), ("Fp", "Fi"), ("Fi", "Fp"), ("OO", "OO")],
    "varios elementos similares, uno minusculas y otro mayusculas" ~: expectPermutacion (todosLosDescifrados ["aa", "AA", "BB", "bb"]) [("aa", "bb"), ("bb", "aa"), ("AA", "AA"), ("BB", "BB")]
    ]

testsEjexpandirClave = test [
    "|clave| = 1, n = |clave|" ~: expandirClave "a" 1 ~?= "a",
    "|clave| = 1, n > |clave|" ~: expandirClave "b" 3 ~?= "bbb",
    "|clave| > 1, n = |clave|" ~: expandirClave "hola" 4 ~?= "hola",
    "|clave| > 1, n > |clave|" ~: expandirClave "mundo" 8 ~?= "mundomun",
    "|clave| > 1, n < |clave|" ~: expandirClave "mundo" 2 ~?= "mu",
    "|clave| > 1, mismo caracter" ~: expandirClave "eeeeeee" 10 ~?= "eeeeeeeeee"
    ]

testsEjcifrarVigenere = test [
    "|s| = 1, |clave| = 1" ~: cifrarVigenere "f" "c" ~?= "h",
    "|s| = 1, |clave| > 1 y repetidos" ~: cifrarVigenere "f" "cc" ~?= "h",
    "|s| = 1, |clave| > 1 y diferente" ~: cifrarVigenere "f" "cd" ~?= "h",
    "|s| > 1 y repetidos, |clave| = 1" ~: cifrarVigenere "fff" "c" ~?= "hhh",
    "|s| > 1 y repetidos, |clave| > 1 y repetidos" ~: cifrarVigenere "fff" "cccc" ~?= "hhh",
    "|s| > 1 y repetidos, |clave| > 1 y diferentes" ~: cifrarVigenere "fff" "cd" ~?= "hih",
    "|s| > 1 y diferentes, |clave| = 1" ~: cifrarVigenere "abc" "d" ~?= "def",
    "|s| > 1 y diferentes, |clave| > 1 y repetidos" ~: cifrarVigenere "abc" "ccc" ~?= "cde",
    "|s| > 1 y diferentes, |clave| > 1 y diferentes" ~: cifrarVigenere "abc" "def" ~?= "dfh",
    "|s| = 0" ~: cifrarVigenere "" "c" ~?= ""
    ]

testsEjdescifrarVigenere = test [
    "|s| = 1, |clave| = 1" ~: descifrarVigenere "h" "c" ~?= "f",
    "|s| = 1, |clave| > 1 y repetidos" ~: descifrarVigenere "h" "cc" ~?= "f",
    "|s| = 1, |clave| > 1 y diferente" ~: descifrarVigenere "h" "cd" ~?= "f",
    "|s| > 1 y repetidos, |clave| = 1" ~: descifrarVigenere "hhh" "c" ~?= "fff",
    "|s| > 1 y repetidos, |clave| > 1 y repetidos" ~: descifrarVigenere "hhh" "cccc" ~?= "fff",
    "|s| > 1 y repetidos, |clave| > 1 y diferentes" ~: descifrarVigenere "hih" "cd" ~?= "fff",
    "|s| > 1 y diferentes, |clave| = 1" ~: descifrarVigenere "def" "d" ~?= "abc",
    "|s| > 1 y diferentes, |clave| > 1 y repetidos" ~: descifrarVigenere "cde" "ccc" ~?= "abc",
    "|s| > 1 y diferentes, |clave| > 1 y diferentes" ~: descifrarVigenere "dfh" "def" ~?= "abc",
    "|s| = 0" ~: descifrarVigenere "" "c" ~?= ""
    ]

testsEjpeorCifrado = test [
    "|s| = 0, |claves| = 1" ~: peorCifrado "" ["as"] ~?= "as",
    "|s| = 1, |claves| = 1" ~: peorCifrado "a" ["as"] ~?= "as",
    "|s| = 1, |claves| > 1 y repetidos" ~: peorCifrado "a" ["as","as","as"] ~?= "as",
    "|s| = 1, |claves| = 1" ~: peorCifrado "a" ["as"] ~?= "as",
    "|s| > 1 y repetidos, |claves| = 1" ~: peorCifrado "aaa" ["as"] ~?= "as",
    "|s| > 1 y repetidos, |claves| > 1 y repetidos" ~: peorCifrado "aaa" ["as","as","as"] ~?= "as",
    "|s| > 1 y repetidos, |claves| > 1 y diferentes" ~: peorCifrado "aaa" ["ab","cd"] ~?= "ab",
    "|s| > 1 y diferentes, |claves| = 1" ~: peorCifrado "abc" ["as"] ~?= "as",
    "|s| > 1 y diferentes, |claves| > 1 y repetidos" ~: peorCifrado "abc" ["as","as","as"] ~?= "as",
    "|s| > 1 y diferentes, |claves| > 1 y diferentes" ~: peorCifrado "abc" ["ab","cd"] ~?= "ab",
    "|s| = 1 , para cada clave |clave| = 1" ~: peorCifrado "a" ["a","b","c"] ~?= "a",
    "|s| = 1 , para cada clave |clave| > 1" ~: peorCifrado "a" ["ab","cd","ef"] ~?= "ab",
    "|s| = 1 , claves tiene elementos de contenido repetido" ~: peorCifrado "a" ["aaaa","bbbb","cccc"] ~?= "aaaa"
    ]

testsEjcombinacionesVigenere = test [
    "|msjs| = 1, |claves| = 1, sin cifrado" ~: combinacionesVigenere ["hola"] ["a"] "" ~?= [],
    "|msjs| = 1, |claves| = 1, relación minúscula" ~: combinacionesVigenere ["hola"] ["b"] "ipmb" ~?= [("hola","b")],
    "|msjs| = 1, |claves| = 1, relación mayúscula" ~: combinacionesVigenere ["hola"] ["b"] "IPMB" ~?= [],
    "|msjs| = 1, |claves| = 1, sin relación" ~: combinacionesVigenere ["hola"] ["b"] "hgtq" ~?= [],
    "|msjs| = |claves| > 1, relación minúscula" ~: combinacionesVigenere ["hola","mundo"] ["a","b"] "ipmb" ~?= [("hola","b")],
    "|msjs| = |claves| > 1, relación mayúscula" ~: combinacionesVigenere ["hola","mundo"] ["a","b"] "ipmB" ~?= [],
    "|msjs| = |claves| > 1, varias relación minúscula" ~: expectPermutacion (combinacionesVigenere ["ab","bc"] ["c","b"] "cd") [("ab","c"),("bc","b")],
    "|msjs| = |claves| > 1, varias relación mayúscula" ~: combinacionesVigenere ["ab","bc"] ["c","b"] "Cd" ~?= [],
    "|msjs| = |claves| > 1, sin relación" ~: combinacionesVigenere ["hola","mundo"] ["a","b"] "wert" ~?= []    
    ]

-- Funciones útiles

-- margetFloat(): Float
-- asegura: res es igual a 0.00001
margenFloat = 0.00001

-- expectAny (actual: a, expected: [a]): Test
-- asegura: res es un Test Verdadero si y sólo si actual pertenece a la lista expected
expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- expectlistProximity (actual: [Float], expected: [Float]): Test
-- asegura: res es un Test Verdadero si y sólo si:
--                  |actual| = |expected|
--                  para todo i entero tal que 0<=i<|actual|, |actual[i] - expected[i]| < margenFloat()
expectlistProximity:: [Float] -> [Float] -> Test
expectlistProximity actual expected = esParecidoLista actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esParecidoLista :: [Float] -> [Float] -> Bool
esParecidoLista actual expected = (length actual) == (length expected) && (esParecidoUnaAUno actual expected)

esParecidoUnaAUno :: [Float] -> [Float] -> Bool
esParecidoUnaAUno [] [] = True
esParecidoUnaAUno (x:xs) (y:ys) = (aproximado x y) && (esParecidoUnaAUno xs ys)

aproximado :: Float -> Float -> Bool
aproximado x y = abs (x - y) < margenFloat


-- expectAnyTuplaAprox (actual: CharxFloat, expected: [CharxFloat]): Test
-- asegura: res un Test Verdadero si y sólo si:
--                  para algun i entero tal que 0<=i<|expected|,
--                         (fst expected[i]) == (fst actual) && |(snd expected[i]) - (snd actual)| < margenFloat()

expectAnyTuplaAprox :: (Char, Float) -> [(Char, Float)] -> Test
expectAnyTuplaAprox actual expected = elemAproxTupla actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)

elemAproxTupla :: (Char, Float) -> [(Char, Float)] -> Bool
elemAproxTupla _ [] = False
elemAproxTupla (ac,af) ((bc,bf):bs) = sonAprox || (elemAproxTupla (ac,af) bs)
    where sonAprox = (ac == bc) && (aproximado af bf)



-- expectPermutacion (actual: [T], expected[T]) : Test
-- asegura: res es un Test Verdadero si y sólo si:
--            para todo elemento e de tipo T, #Apariciones(actual, e) = #Apariciones(expected, e)

expectPermutacion :: (Ord a, Show a) => [a] -> [a] -> Test
expectPermutacion actual expected = esPermutacion actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esPermutacion :: Ord a => [a] -> [a] -> Bool
esPermutacion a b = (length a == length b) && (sort a == sort b)
