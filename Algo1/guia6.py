import math

#Ejercicio 1
#1
def imprimir_hola_mundo():
    print("Hola mundo")

#imprimir_hola_mundo()

#2
#def imprimir_un_verso():
    
#3
def raizDe2():
    return round(math.sqrt(2), 4)

#raizDe2()

#4
def factorial_2() -> int:
    return 2

#factorial_2()

#5
def perimetro() -> float:
    return 2 * math.pi

#perimetro()

#Ejercicio 2
#1
def imprimir_saludo(nombre: str):
    print("Hola " + nombre)

#imprimir_saludo("Mateo")

#2
def raiz_cuadrada_de(numero: float) -> float:
    return math.sqrt(numero)

#print(raiz_cuadrada_de(25))

#3
def fahrenheit_a_celsius(temp_far: float) -> float: 
    return ((temp_far - 32) * 5/9)

#print(fahrenheit_a_celsius(89))

#4
def imprimir_dos_veces(estribillo: str) -> str:
    print(estribillo * 2) 

#imprimir_dos_veces("abcde")

#5
def es_multiplo_de(n: int, m: int) -> bool:
    while (n >= m):
        print(n)
        n -= m
    if n == 0 :
        print(n)
        return True
    else:
        print(n)
        return False

#print(es_multiplo_de(13,3))

#6
def es_par(n: int) -> bool:
    while (n >= 2):
        print(n)
        n -= 2
    if n == 0 :
        print(n)
        return True
    else:
        print(n)
        return False
    
#print(es_par(11))

#7
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    x = ((comensales * min_cant_de_porciones) / 8)
    if x % 8 == 0:
        return x
    else:
        return (x // 1 + 1) 
    
def techo(n: float) -> int:
    if n % 1 == 0:
        return n
    else:
        return (n // 1 + 1) 
    
#print(techo(1.3))

#print(cantidad_de_pizzas(3,4))

#Ejercicio 3
#1
def alguno_es_0(numero1: float, numero2: float) -> bool:
    return (numero1 == 0 or numero2 == 0) 

#print(alguno_es_0(1,1))

#2
def ambos_son_0(numero1: float, numero2: float) -> bool:
    return (numero1 == 0 and numero2 == 0) 

#print(ambos_son_0(0,0))

#3
def es_nombre_largo(nombre: str) -> bool:
    return len(nombre) <= 8 and len(nombre) >= 3

#print(es_nombre_largo("Mateo"))

#4
def es_bisiesto(anio: int) -> bool:
    return (anio % 400 == 0) or (anio % 4 == 0 and anio % 100 != 0)

#print(es_bisiesto(2024))

#Ejercicio 4
def peso_pino(altura_pino: int) -> int:
    if altura_pino <= 3:
        return 300 * altura_pino
    else:
        return 300 * 3 + 200 * (altura_pino - 3)
    
def es_peso_util(peso_pino: int) -> bool:
    return 400 <= peso_pino <= 1000

def sirve_pino(altura_pino: int) -> bool:
    return es_peso_util(peso_pino(altura_pino))

#print(sirve_pino(2))

#Ejercicio 5
#1
def devolver_el_doble_si_es_par(numero: int) -> int:
    if numero % 2 == 0:
        return 2 * numero
    else:
        return numero

#print(devolver_el_doble_si_es_par(1))

#2
def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) -> int:
    if numero % 2 == 0:
        return numero
    else:
        return numero + 1
    
#print(devolver_valor_si_es_par_sino_el_que_sigue(3))

#3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    if numero % 9 == 0:
        return numero * 3
    elif numero % 3 == 0:
        return numero *2
    else:
        return numero
    
#print(devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(18))

#4
def lindo_nombre(nombre: str):
    if len(nombre) >= 5:
        print("Tu nombre tiene muchas letras")
    else:
        print("Tu nombre tiene menos de 5 caracteres")

#lindo_nombre("Mateo")

#5
def el_rango(numero: int):
    if numero < 5:
        print("Menor a 5")
    elif 10 <= numero <= 20:
        print("Entre 10 y 20")
    elif numero > 20:
        print("Mayor a 20")

#el_rango(10)

#6
def trabajo_o_vacaciones (edad: int, sexo: chr):
    if edad < 18:
        print("Anda de vacaciones")
    elif edad >= 60 and sexo == 'F':
        print("Anda de vacaciones")
    elif edad >= 65:
        print("Anda de vacaciones")
    else:
        print("Te toca trabajar")

#trabajo_o_vacaciones(60,'M')

#Ejercicio 6
#1
def uno_al_diez ():
    i = 1
    while i <= 10:
        print(i)
        i += 1

#uno_al_diez()

#2
def pares_del_10_al_40 ():
    i = 10
    while i <= 40:
        print(i)
        i += 2

#pares_del_10_al_40()

#3
def eco ():
    i = 0
    while i < 10:
        print("eco")
        i += 1

#eco()

#4
def cuenta_regresiva(numero: int):
    i = numero
    while i > 0:
        print(i)
        i -= 1
    print("Despegue")

#cuenta_regresiva(18)

#5
def viaje_en_el_tiempo (anio_de_salida: int, anio_de_llegada: int):
    anio = anio_de_salida - 1
    while anio >= anio_de_llegada:
        print("Viajó un año al pasado, estamos en el año:", anio)
        anio -= 1

#viaje_en_el_tiempo(2025,2020)

#6
def anio_aristoteles (anio_de_salida: int):
    anio = anio_de_salida
    while anio > (-384) and anio - (-384) >= 10:
        anio -= 20
        print("Viajó veinte años al pasado, estamos en el año:", anio)

#anio_aristoteles(270)

#Ejercicio 7
#1
def uno_al_diez_v2 ():
    for num in range(1,11,1):
        print(num)

#uno_al_diez_v2()

#2
def pares_del_10_al_40_v2 ():
    for num in range(10,41,2):
        print(num)

#pares_del_10_al_40_v2()

#3
def eco_v2 ():
    for num in range(1,11,1):
        print("eco")

#eco_v2()

#4
def cuenta_regresiva_v2(numero: int):
    for n in range(numero,0,-1):
        print(n)
    print("Despegue")

#cuenta_regresiva(10)

#5
def viaje_en_el_tiempo_v2(anio_de_salida: int, anio_de_llegada: int):
    for anio in range(anio_de_salida, anio_de_llegada - 1, -1):
        print ("Viajó un año al pasado, estamos en el año:", anio)

#viaje_en_el_tiempo_v2(2025,2020)

#6
def anio_aristoteles_v2(anio_de_salida: int):
        for anio in range(anio_de_salida, -395, -20):
            print("Viajó veinte años al pasado, estamos en el año:", anio)

#anio_aristoteles_v2(12)

#Ejercicio 8
#1
def uno(x:int, y:int):
    #estado 1
    x = x + y
    #estado 2

#uno(5,7)

#2
def dos(x:int, y:int):
    #estado 1
    #cuanto vale z aca?
    z = x + y
    #estado 2
    y = z * 2
    #estado 3

#dos(5,7)

#3
def tres(x:int, y:int):
    #estado 1
    x = "hora"
    #estado 2
    y = x * 2
    #estado 3

#tres(5,7)

#4
def cuatro(x: bool):
    #estado 1
    x = not x
    #estado 2
    return x

#cuatro(False)

#5
def cinco(x: bool) -> bool:
    #estado 1
    x = not x
    #estado 2
    return x

cinco(False)

#6
#Esta bien???
def seis(x: bool, y: bool) -> bool:
     return x and y

x = seis(True, False) and True

#Ejercicio 9
def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g

g: int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

#1
#print(ro(1))
#print(ro(1))
#print(ro(1))

#2
#print(rt(1, 0))
#print(rt(1, 0))
#print(rt(1, 0))