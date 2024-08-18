import random

#Primera parte
#Ejercicio 1
#1
def pertenece1 (s: list[int], e: int) -> bool:
  for i in s:
    if i == e:
      return True
  return False

#print(pertenece1([1,2,3],3))

def pertenece2 (s: list[int], e: int) -> bool:
  i = 0
  while i < len(s):
    if s[i] == e:
      return True
    i += 1
  return False

#print(pertenece2([1,2,3],4))

def pertenece3 (s: list[int], e: int) -> bool:
  if s.count(e) == 0 :
    return False
  else:
    return True 

#print(pertenece3([1,2,3],3))

#2
def divide_a_todos (s: list[int], e: int) -> bool:
  for i in s:
    if i % e == 0:
      break
    else:
      return False
  return True

#print(divide_a_todos([9,6,3],3))

#3
def suma_total (s: list[int]) -> int:
  x: int = 0
  for i in s:
    x += i
  return x

#print(suma_total([9,6,3]))

#4
def ordenados (s: list[int]) -> bool:
  for i in range (len(s) - 1):
    if s[i] > s[i + 1]:
      return False
  return True

#print(ordenados([1,2,3]))

#5
def palabra_mayor_7 (s: list[str]) -> bool:
  for i in s:
    if len(i) > 7:
      return True
  return False

#print(palabra_mayor_7(["hola"]))

#6
def capicua (s: str) -> bool:
  for i in range (len(s)//2):
    if s[i] != s[-i - 1]:
      return False
  return True

#print(capicua("neuquen"))
#print(capicua("oszo"))

#7
def contrasenia (c: str) -> str:
  if len(c) > 8 and contiene_mayuscula(c) and contiene_minuscula(c) and contiene_numero(c):
    return "VERDE"
  elif len(c) < 5:
    return "ROJA"
  else:
    return "AMARILLA"

def contiene_minuscula (p: str) -> bool:
  for i in range (len(p)):
    if 97 <= ord(p[i]) <= 122:
      return True
  return False

def contiene_mayuscula (p: str) -> bool:
  for i in range (len(p)):
    if 65 <= ord(p[i]) <= 90:
      return True
  return False

def contiene_numero (p: str) -> bool:
  for i in range (len(p)):
    if 48 <= ord(p[i]) <= 57:
      return True
  return False

#print(contrasenia("Heo0"))

#8
def saldo_actual (cuenta: list[tuple[str, int]]):
  saldo = 0
  for tuple in cuenta:
    if tuple[0] == 'R':
      saldo -= tuple[1]
    elif tuple[0] == "I":
      saldo += tuple[1]
  return saldo

#print(saldo_actual([('I',2000), ('R', 20),('R', 1000),('I', 300)]))

#9
def tres_vocales_distintas (palabra: str) -> bool:
  vocales = ['a','e','i','o','u']
  vocales_distintas = 0
  vocales_contadas = list()
  for letra in palabra:
    #se puede usar la funcion in para determinar si un elemento pertenece a una lista?
    if pertenece(vocales, letra) and not pertenece(vocales_contadas, letra):
      vocales_distintas += 1
      vocales_contadas.append(letra)
  if vocales_distintas >= 3:
    return True
  else:
    return False
  
def pertenece(lista: list[str], vocal: str):
  for letra in lista:
    if letra == vocal:
      return True
  return False
  
#print(tres_vocales_distintas("caaaiondy"))

#Segunda Parte
#Ejercicio 2
#1
#numeros = [1,2,3,4]
#print(numeros)
def posicion_par_0_inout (numeros: list[int]) -> list[int]:
  for i in range (0, len(numeros)):
    if i % 2 == 0:
      numeros[i] = 0
  return numeros

#posicion_par_0_inout(numeros)
#print(numeros)

#2
#numeros = [1,2,3,4]
#print(numeros)

def posicion_par_0_in (numeros: list[int]) -> list[int]:
  lista = list()
  for i in range (0, len(numeros)):
    if i % 2 == 0:
      lista.append(0)
    else:
      lista.append(numeros[i])
  return lista

#print(posicion_par_0_in([1,2,3,4]))
#posicion_par_0_in(numeros)
#print(numeros)

#3
def elimina_vocales (texto: list[str]) -> list[str]:
  texto_salida = list()
  for caracter in texto:
    if caracter  not in ['a','e','i','o','u']:
      texto_salida.append(caracter)
  return texto_salida

#print(elimina_vocales("hola amigos de youtube"))

#4
def reemplaza_vocales (texto: list[str]) -> list[str]:
  texto_salida = list()
  for caracter in texto:
    if caracter  not in ['a','e','i','o','u']:
      texto_salida.append(caracter)
    else:
      texto_salida.append('_')
  return texto_salida

#print(reemplaza_vocales("hola amigos de youtube"))

#5
def da_vuelta_str (texto: list[str]) -> list[str]:
  texto_salida = list()
  for i in range (len(texto) -1, -1 , -1):
    texto_salida.append(texto[i])
  return texto_salida

#print(da_vuelta_str("hola amigos de youtube"))

#6
def eliminar_repetidos (texto: list[str]) -> list[str]:
  caracteres_contados = list()
  texto_salida = list()
  for caracter in texto:
    if caracter not in caracteres_contados:
      texto_salida.append(caracter)
      caracteres_contados.append(caracter)
  return texto_salida

#print(eliminar_repetidos("hola amigos de youtube"))

#Ejercicio 3
def aprobado (notas: list[int]) -> int:
  if notas_mayores_a_cuatro(notas) and promedio(notas) >= 7:
    return 1
  elif notas_mayores_a_cuatro(notas) and 4 <= promedio(notas) < 7:
    return 2
  elif not notas_mayores_a_cuatro(notas) or promedio(notas) < 4:
    return 3
  
def notas_mayores_a_cuatro (notas: list[int]) -> bool:
  for nota in notas:
    if nota < 4:
      return False
  return True

def promedio (notas: list[int]) -> float:
  promedio = 0
  for nota in notas:
    promedio += nota
  promedio = promedio / len(notas)
  return promedio

#print(aprobado([7]))

#Ejercicio 4
#1
def lista_estudiantes () -> list[str]:
  lista_estudiantes = list()
  entrada = ""
  print("Ingrese el nombre del alumno para aniadirlo a la lista, ingrese 'listo' para finalizar")
  while entrada != "listo":
    nombre_estudiante = input()
    entrada = nombre_estudiante
    if entrada != "listo":
      lista_estudiantes.append(nombre_estudiante)
  print(f"La lista de alumnos es: {lista_estudiantes}")

#lista_estudiantes()

#2
def historial_de_movimientos () -> list[tuple[str, float]]:
  historial_movimientos = []
  entrada = ''
  print("Bienvenido al sistema de carga SUBE")
  while entrada != 'X':
    entrada = input("\nIngrese: 'C' para cargar salgo, 'D' para descontar saldo, 'X' para finalizar\n")
    if entrada == 'C':
      monto = int(input("Ingrese monto: "))
      historial_movimientos.append((entrada, monto))
    if entrada == 'D':
      monto = int(input("Ingrese monto: "))
      historial_movimientos.append((entrada, monto))
  print(f"\nMovimientos: {historial_movimientos}")

#historial_de_movimientos()

#3
def siete_y_medio ():
  print("Juguemos al siete y medio!")
  juego_en_curso: bool = True 
  puntaje_total: int = 0
  cartas_jugadas: list[int] = list()
  while juego_en_curso:
    carta: int = sacar_carta()
    cartas_jugadas.append(carta)
    print(f"Su carta es un: {carta}")
    if carta in [10,11,12]:
      puntaje_total += 0.5
    else: 
      puntaje_total += carta
    if puntaje_total > 7.5:
      print("Perdiste!")
      juego_en_curso = False
    elif puntaje_total == 7.5:
      print("Ganaste!")
      juego_en_curso = False
    if juego_en_curso:
      print("'C' para sacar otra carta, 'P' para plantarse")
      entrada = input()
      if entrada == 'C':
        print("Saco otra carta!")
      elif entrada == 'P':
        print("Fin del juego!")
        juego_en_curso = False
  print(f"Tus cartas fueron: {cartas_jugadas}")
    
def sacar_carta () -> int:
  carta = random.randint(1,12)
  while carta in [8,9]:
    carta = random.randint(1,12)
  return carta

#siete_y_medio()

#Ejericio 5
#1 y 2
lista_bool_1 = []

def pertenece_a_cada_uno_version_2 (s: list[list[int]], e: int, res: list[bool]):
  res.clear
  for lista in s:
    res.append(pertenece1(lista, e))

(pertenece_a_cada_uno_version_2([[1,2,3],[3,4,5],[6,7,8]],1,lista_bool_1))
#print(lista_bool_1)
 
#la version 2 fuerza a la 1
#se puede usar la v2 para la v1 pero no la v1 para la v2

#3
def es_matriz (s: list[list[int]]) -> bool:
  return len(s) > 0 and len(s[0]) > 0 and filas_mismo_largo(s)

def filas_mismo_largo (s: list[list[int]]) -> bool:
  for fila in s:
    if len(fila) != len(s[0]):
      return False
  return True

#print(es_matriz([[1,2,0],[1,2,6]]))

#4
lista_bool_2 = []

def filas_ordenadas (m: list[list[int]], res: list[bool]):
  res.clear
  for fila in m:
    res.append(ordenados(fila))

filas_ordenadas([[1,2,3],[3,2,1],[0,0,0]],lista_bool_2)
#print(lista_bool_2)

#5
def elevar_matriz (d: int, p: int) -> list[list[int]]:
  matriz_final = list()
  fila_final = list()
  matriz = matriz_cuadrada_random(d)
  matriz_final = matriz
  if p == 0:
    return matriz_identidad(d)
  if p == 1:
    return matriz
  else:
    for k in range (1, p):
      matriz_final = multiplicar_matrices_cuadradas(matriz, matriz_final)
    return matriz_final

def matriz_cuadrada_random (d: int) -> list[list[int]]:
  matriz = list()
  for i in range (0,d):
    fila = list()
    for j in range (0, d):
      fila.append(random.randint(0,9))
    matriz.append(fila)
  return matriz

def matriz_identidad (d: int) -> list[list[int]]:
  matriz = list()
  contador_fila = 0
  for i in range (0, d):
    fila = list()
    for j in range (0, d):
      if j == contador_fila:
        fila.append(1)
      else:
        fila.append(0)
    matriz.append(fila)
    contador_fila += 1
  return matriz

def multiplicar_matrices_cuadradas (m1: list[list[int]], m2: list[list[int]]) -> list[list[int]]:
  matriz_final = list()
  fila_final = list()
  valor = 0
  for fila in m1:
    for i in range (0, len(m1)):
      for j in range(0, len(m1)):
        valor += (fila[j]) * (m2[j])[i]
      fila_final.append(valor)
      valor = 0
    matriz_final.append(fila_final)
    fila_final = list()
  return matriz_final
    
#print(elevar_matriz(3, 4))