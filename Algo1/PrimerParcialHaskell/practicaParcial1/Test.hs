import Examen
import Test.HUnit

testAfirmativos = runTestTT testVotosAfirmativos
testFormulas = runTestTT testFormulasInvalidas
testPorcentaje = runTestTT testPorcentajeDeVotos
testMenos = runTestTT testMenosVotado

testVotosAfirmativos = test [
  "votos[] y formulas[] vacio" ~: (porcentajeDeVotosAfirmativos [] [] 0) ~?= 0,
  "sin votos en blanco" ~: (porcentajeDeVotosAfirmativos [("1","2")] [100] 100) ~?= 1,
  "todos votos en blanco" ~: (porcentajeDeVotosAfirmativos [("1","2")] [0] 100) ~?= 0,
  "50 porciento" ~: (porcentajeDeVotosAfirmativos [("1","2"),("3","4")] [100,100] 400) ~?= 0.5
  ]

testFormulasInvalidas = test [
  "formula vacia" ~: (formulasInvalidas []) ~?= False,
  "presi y vice misma persona" ~: (formulasInvalidas [("1","1")]) ~?= True,
  "presi + de 1 vez" ~: (formulasInvalidas [("1","2"),("1","3")]) ~?= True,
  "vice + de 1 vez" ~: (formulasInvalidas [("1","2"),("3","2")]) ~?= True,
  "presi + vice misma persona" ~: (formulasInvalidas [("1","2"),("3","1")]) ~?= True,
  "formula valida" ~: (formulasInvalidas [("1","2"),("4","5")]) ~?= False
  ]

testPorcentajeDeVotos = test [
  "una sola formula" ~: (porcentajeDeVotos "2" [("1","2")] [10]) ~?= 1,
  "dos formulas, mismos votos" ~: (porcentajeDeVotos "2" [("1","2"),("3","4")] [10,10]) ~?= 0.5,
  "dos formulas, distintos votos" ~: (porcentajeDeVotos "2" [("1","2"),("3","4")] [20,80]) ~?= 0.2
  ]

testMenosVotado = test [
  "unica lista" ~: (menosVotado [("1","2")] [10]) ~?= "1",
  "varias listas" ~: (menosVotado [("1","2"),("3","4"),("5","6")] [10,20,5]) ~?= "5"
  ]