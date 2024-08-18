import random
from typing import Any
# Archivos

# Ejercicio 1
# 1
def contar_lineas (nombre_archivo: str) -> int:
  archivo = open(nombre_archivo)
  numero_lineas: int = 0
  for linea in archivo:
    numero_lineas += 1
  return numero_lineas

# print(contar_lineas("texto.txt"))

# 2
def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
  palabras = palabras_archivo(nombre_archivo)
  palabra = str_to_str_list(palabra)
  if palabras.count(palabra) != 0:
    return True
  else:
    return False

def palabras_archivo(nombre_archivo: str) -> list[str]:
  archivo = open(nombre_archivo, 'r')
  lineas = archivo.readlines()
  palabras = []
  palabra = []
  for linea in lineas:
    linea = str_to_str_list(linea)
    for caracter in linea:
      if 65 <= (ord (caracter)) <= 90 or 97 <= (ord (caracter)) <= 122 :
        palabra.append(caracter)
      else:
        if palabra != []: 
          palabras.append(palabra)
        palabra = []
  if palabra != []: 
    palabras.append(palabra)
  archivo.close()
  return palabras

def str_to_str_list (texto: str) -> list[str]:
  caracteres: list[str] = []
  for i in range (0, len(texto)):
    caracteres.append(texto[i])
  return caracteres

def str_list_to_str (texto: list[str]) -> str:
  string = ''
  for caracter in texto:
    string = string + caracter
  return string

# print(existe_palabra("Hola","texto.txt"))

# 3
def cantidad_apariciones (nombre_archivo: str, palabra: str) -> int:
  archivo = open(nombre_archivo,'r')
  archivo = archivo.readlines
  palabras = palabras_archivo(nombre_archivo)
  palabra = str_to_str_list(palabra)
  return palabras.count(palabra)

# print(cantidad_apariciones("texto.txt","miras"))

# Ejericio 2
def clonar_sin_comentarios (nombre_archivo: str):
  archivo_fuente = open(nombre_archivo, 'r')
  lineas = archivo_fuente.readlines()
  lineas_sin_espacios = []
  lineas_archivo_nuevo = []
  archivo_nuevo = open("texto_sin_comentarios.txt", 'w') 
  for linea in lineas:
    lineas_sin_espacios.append(eliminar_espacios_iniciales(linea))
  for linea in lineas_sin_espacios:
    if linea[0] != '#':
      lineas_archivo_nuevo.append(str_list_to_str(linea))
  archivo_nuevo.write(str_list_to_str(lineas_archivo_nuevo))
  archivo_fuente.close()
  archivo_nuevo.close()

def eliminar_espacios_iniciales (texto: str) -> list[str]:
  texto_sin_espacios: list[str] = []
  es_espacio: bool = True
  for caracter in texto:
    if caracter != ' ' and es_espacio == True:
      es_espacio = False
    if es_espacio == False:
      texto_sin_espacios.append(caracter)
  return texto_sin_espacios

# clonar_sin_comentarios("texto.txt")

# Pilas
from queue import LifoQueue as Pila

# Ejericio 8
def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Pila[int]:
  pila: Pila[int] = Pila()
  for i in range(0, cantidad):
    numero = random.randint(desde, hasta)
    pila.put(numero)
    #print(numero, end=' ')
  return pila

# generar_nros_al_azar(0,0,10)

# Ejericio 9
def pila_a_lista(p: Pila[any]) -> list[any]:
  lista: list[any] = list()
  lista_final: list[any] = list()
  while not p.empty():
    lista.append(p.get())
  for i in range(len(lista) - 1, -1, -1):
    p.put(lista[i])
  for i in range(len(lista) - 1, -1, -1):
    lista_final.append(lista[i])
  return lista_final

def cantidad_elementos(p: Pila) -> int:
  contador: int = 0
  lista: list[any] = pila_a_lista(p)
  for i in lista:
    contador += 1
  return contador

# print(cantidad_elementos(generar_nros_al_azar(5,0,10)))

# Ejercicio 10
def buscar_el_maximo (p: Pila[int]) -> int:
  lista: list[int] = pila_a_lista(p)
  maximo: int = 0
  for i in lista:
    if i > maximo:
      maximo = i
  return maximo

# print(buscar_el_maximo(generar_nros_al_azar(5,0,10)))

# Ejericio 11
def esta_bien_balanceada(s: str) -> bool:
  parentesis_abiertos: int = 0
  caracteres_entre_parentesis = 0
  ecuacion: list[str] = str_to_str_list(s)
  for caracter in ecuacion:
    if caracter != ' ':
      if caracter == '(':
        parentesis_abiertos += 1
      elif caracter == ')' and parentesis_abiertos == 0:
        return False
      elif caracter == ')' and parentesis_abiertos > 0 and caracteres_entre_parentesis > 0:
        parentesis_abiertos -= 1
        caracteres_entre_parentesis = 0
      elif parentesis_abiertos > 0:
        caracteres_entre_parentesis += 1
  if parentesis_abiertos > 0:
    return False
  else:
    return True 

# print(esta_bien_balanceada("1 + (1) 2 x 3 (2) ( 1)"))

# Ejercicio 12
def evaluar_expresion(s: str) -> float:
  operando: list[int] = [0,1,2,3,4,5,6,7,8,9]
  operador: list[str] = ['+','-','*','/']
  pila_evaluacion: Pila[int] = Pila()
  tokens: list[str,int] = expresion_a_tokens(s)
  for token in tokens:
    if pertenece(operando, token):
      pila_evaluacion.put(token)
    elif pertenece(operador ,token):
      a: int = int(pila_evaluacion.get())
      b: int = int(pila_evaluacion.get())
      c: int = 0
      if token == '+':
        c = a + b
      elif token == '-':
        c = b - a
      elif token == '*':
        c = a * b
      elif token == '/':
        c = a / b
      pila_evaluacion.put(c)
  resultado = pila_evaluacion.get() 
  return resultado

def expresion_a_tokens (s: str) -> list[str,int]:
  operando: list[str] = ['0','1','2','3','4','5','6','7','8','9']
  operador: list[str] = ['+','-','*','/']
  tokens: list[str,int] = list()
  for caracter in s:
    if caracter != ' ':
      if pertenece(operando, caracter):
        tokens.append(int(caracter))
      elif pertenece(operador, caracter):
        tokens.append(caracter)
  return tokens

    
def pertenece(l: list[any], e: any) -> bool:
  for elemento in l:
    if elemento == e:
      return True
  return False

#expresion = "3 4 + 5 * 2 -"
#resultado = evaluar_expresion(expresion)
#print(resultado) # Deber´ıa devolver 33

# Colas
from queue import Queue as Cola

# Ejericio 13
def generar_nros_al_azar_2(cantidad: int, desde: int, hasta: int) -> Cola[int]:
  cola: Cola[int] = Cola()
  for i in range(0, cantidad):
    numero_random: int = random.randint(desde, hasta)
    cola.put(numero_random)
    #print(numero_random, end=' ')
  return cola

# cola = generar_nros_al_azar_2(5,0,10)

# Ejericio 14
def cantidad_elementos_2(c: Cola) -> int:
  l: list[any] = cola_a_lista(c)
  cantidad_elementos: int = 0
  for i in l:
    cantidad_elementos += 1
  return cantidad_elementos

def cola_a_lista(c: Cola[any]) -> list[any]:
  l: list[any] = list()
  while not c.empty():
    l.append(c.get())
  for i in l:
    c.put(i)
  return l

#print(cantidad_elementos(cola))

# Ejercicio 15
def buscar_el_maximo_2(c: Cola[int]) -> int:
  l: list[int] = cola_a_lista(c)
  maximo: int = 0
  for i in l:
    if i > maximo:
      maximo = i
  return maximo

# Ejericio 16
def armar_secuencia_de_bingo() -> Cola[int]:
  l: list[int] = list()
  c: Cola[int] = Cola()
  while len(l) < 100:
    numero_random = random.randint(0,99)
    if numero_random not in l:
      l.append(numero_random)
      c.put(numero_random)
  return c

def armar_carton_bingo() -> list[int]:
  l: list[int] = list()
  while len(l) < 12:
    numero_random = random.randint(0,99)
    if numero_random not in l:  
      l.append(numero_random)
  return l

def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
  bolillero: list[int] = cola_a_lista(bolillero)
  jugadas: int = 0
  numeros_tachados: int = 0
  for bolilla in bolillero:
    if numeros_tachados < 12:
      jugadas += 1
      if bolilla in carton:
        numeros_tachados += 1
  return jugadas

# print(jugar_carton_de_bingo(armar_carton_bingo(), armar_secuencia_de_bingo()))

# Ejercicio 17
def generador_pacientes() -> Cola[(int,str,str)]:
  c: Cola[(int,str,str)] = Cola()
  for i in range(0, random.randint(10,20)):
    c.put((random.randint(1,10),'a','b'))
  return c

def n_pacientes_urgentes(c: Cola[(int,str,str)]) -> int:
  pacientes: list[(int,str,str)] = cola_a_lista(c)
  pacientes_urgentes: int = 0
  for paciente in pacientes:
    if paciente[0] in [1,2,3]:
      pacientes_urgentes += 1
  return pacientes_urgentes

# print(n_pacientes_urgentes(generador_pacientes()))

# Ejercicio 18
def generador_clientes() -> Cola[(str,int,bool,bool)]:
  c: Cola[(str,int,bool,bool)] = Cola()
  for i in range(0, random.randint(10,20)):
    random_bool_state_1 = random.randint(0,1)
    random_bool_state_2 = random.randint(0,1)
    prio: bool
    pref: bool
    if random_bool_state_1 == 0:
      prio = False
    elif random_bool_state_1 == 1:
      prio = True 
    if random_bool_state_2 == 0:
      pref = False
    elif random_bool_state_2 == 1:
      pref = True
    c.put(('a',i,prio,pref))
  return c

def atencion_a_clientes(c: Cola[(str,int,bool,bool)]) -> Cola[(str,int,bool,bool)]:
  l: list[(str,int,bool,bool)] = cola_a_lista(c)
  l_prio: list[(str,int,bool,bool)] = list()
  l_pref: list[(str,int,bool,bool)] = list()
  l_resto: list[(str,int,bool,bool)] = list()
  c_atentcion: Cola[(str,int,bool,bool)] = Cola()
  for i in range(0,len(l)):
    if l[i][3] == True:
      l_prio.append(l[i])
    elif l[i][2] == True:
      l_pref.append(l[i])
    else:
      l_resto.append(l[i])
  for i in l_prio:
    c_atentcion.put(i)
  for i in l_pref:
    c_atentcion.put(i)
  for i in l_resto:
    c_atentcion.put(i)
  return c_atentcion

atencion_a_clientes(generador_clientes())

# Diccionarios
# Ejericio 19
def agrupar_por_longitud(nombre_archivo: str) -> dict:
  grupos: dict[int,int] = dict()
  longitudes: list[int] = longitudes_palabras(palabras_archivo(nombre_archivo))
  for long in longitudes:
    grupos[long] = longitudes.count(long)
  return grupos

def longitudes_palabras(palabras: list[str]) -> list[int]:
  longitudes: list[int] = list()
  for palabra in palabras:
    longitud = 0
    for caracter in palabra:
      longitud += 1
    longitudes.append(longitud)
  return longitudes

# print(agrupar_por_longitud('texto.txt'))

# Ejercicio 21
def la_palabra_mas_frecuente(nombre_archivo: str) -> str:
  dict_palabras: dict[str,int] = diccionario_palabras(nombre_archivo)
  palabra_mas_frecuente: str = ''
  frecuencia: int = 0
  for i in dict_palabras.items():
    if i[1] > frecuencia:
      frecuencia = i[1]
      palabra_mas_frecuente = i[0]
  return palabra_mas_frecuente 

def diccionario_palabras(nombre_archivo: str) -> dict:
  dict_palabras: dict[str,int] = dict()
  palabras: list[str] = palabras_archivo(nombre_archivo)
  for palabra in palabras:
    dict_palabras[str_list_to_str(palabra)] = palabras.count(palabra)
  return dict_palabras

# print(la_palabra_mas_frecuente('texto.txt'))

# Ejercicio 22
def generador_historiales() -> dict[str,Pila[str]]:
  historiales: dict[str,Pila[str]] = dict()
  for i in range(0, 4):
    historial = Pila()
    for j in range(1,4):
      historial.put(f'{i*j}')
    historiales[f'usr{i}'] = historial
  return historiales

def visitar_sitio(historiales: dict[str,Pila[str]], usuario: str, sitio: str):
  if usuario in historiales.keys():
    historiales[usuario].put(sitio)
  else:
    historial: Pila[str] = Pila()
    historial.put(sitio)
    historiales[usuario] = historial 
  return historiales[usuario]

def navegar_atras(historiales: dict[str,Pila[str]], usuario: str):
  historiales[usuario].get()
  return historiales[usuario]

#historiales = generador_historiales()
#print(pila_a_lista(historiales['usr3']))
#print(pila_a_lista(visitar_sitio(historiales, 'usr3', 'youtube')))
#print(pila_a_lista(navegar_atras(historiales, 'usr3')))

# Ejercicio 23
def agregar_producto(inventario: dict[str,dict[str,int]], nombre: str, precio: int, cantidad: int):
  inventario[nombre] = {'precio':precio, 'cantidad':cantidad}

def actualizar_stock(inventario: dict[str,dict[str,int]], nombre: str, cantidad: int):
  if nombre in inventario.keys():
    inventario[nombre]['cantidad'] = cantidad

def actualizar_precio(inventario: dict[str,dict[str,int]], nombre: str, precio: int):
  if nombre in inventario.keys():
    inventario[nombre]['precio'] = precio

def calcular_valor_inventario(inventario: dict[str,dict[str,int]]) -> float:
  valor_inventario: float = 0
  for producto in inventario.values():
    valor_inventario += producto['precio']*producto['cantidad']
  return valor_inventario

#inventario = {}
#agregar_producto(inventario, "Camisa", 20.0, 50)
#agregar_producto(inventario, "Pantalon", 30.0, 30)
#actualizar_stock(inventario, "Camisa", 10)
#actualizar_precio(inventario, 'Pantalon', 20)
#valor_total = calcular_valor_inventario(inventario)
#print("Valor total del inventario:", valor_total)
#print(inventario)