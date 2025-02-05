#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb  1 17:12:55 2025

@author: mateo
"""

# Actividad 00

empleado_01 = [
    [20222333, 45, 2, 20000],
    [33456234, 40, 0, 25000],
    [45432345, 41, 1, 10000]
]


# Actividad 01

def superanSalarioActividad01(matriz, umbral):
    res = []
    for fila in matriz:
        if fila[3] > umbral:
            res.append(fila)
    return res

# print(superanSalarioActividad01(empleado_01, 15000))

# Actividad 02

empleado_02 = [
    [20222333, 45, 2, 20000],
    [33456234, 40, 0, 25000],
    [45432345, 41, 1, 10000],
    [43967304, 37, 0, 12000],
    [42236276, 36, 0, 18000]
]

# print(superanSalarioActividad01(empleado_02, 15000))

# Actividad 03

empleado_03 = [
    [20222333, 20000, 45, 2],
    [33456234, 25000, 40, 0],
    [45432345, 10000, 41, 1],
    [43967304, 12000, 37, 0],
    [42236276, 18000, 36, 0]
]

def superanSalarioActividad03(matriz, umbral):
    res = []
    for fila in matriz:
        if fila[1] > umbral:
            nueva_fila = []
            nueva_fila.append(fila[0])
            nueva_fila.append(fila[2])
            nueva_fila.append(fila[3])
            nueva_fila.append(fila[1])
            res.append(nueva_fila)
    return res

# print(superanSalarioActividad03(empleado_03, 15000))

# Actividad 04

empleado_04 = [
    [20222333, 33456234, 45432345, 43967304, 42236276],
    [20000, 25000, 10000, 12000, 18000],
    [45, 40, 41, 37, 36],
    [2, 0, 1, 0, 0]
]

def superanSalarioActividad04(matriz, umbral):
    res = []
    for i in range(len(matriz[1])):
        if matriz[1][i] > umbral:
            empleado = []
            empleado.append(matriz[0][i])
            empleado.append(matriz[2][i])
            empleado.append(matriz[3][i])
            empleado.append(matriz[1][i])
            res.append(empleado)
    return res


print(superanSalarioActividad04(empleado_04, 15000))

# Actividad 05
'''
1.a. Cuando agregue mas filas pude reutilizar la misma funcion, es decir la programacion no cambio
1.b. En el caso en que se altero el orden, el programa casi no cambiaria si no fuese porque hay que devolver la listas en el orden original, eso llevo a que tuviera que reacomodar las columnas

2. Cuando se cambio la representacion de filas a columnas fue cuando mas cambio el programa y la de rearmar las filas a partir de columnas.

3. Las ventajas son varias, una es que hay menos trabajo por hacer, la otra es que sin importar como estas implementadas o dispuestas internamente las matrizes, las operaciones que realiza el usuario siempre son controladas pues son llevadas a cabo a travez de las funciones que define el DBMS.
'''