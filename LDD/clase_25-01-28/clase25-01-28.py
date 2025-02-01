#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jan 28 11:05:46 2025

@author: mateo
"""

file_path = '/home/mateo/Documents/CS/LDD/'

# Archivos

file_name = 'datame.txt'
file = open(file_path + file_name, 'rt')
data = file.read()
file.close()

# print(data)

data = 'Bienvenidos a LDD\n\n' + data
data = data + '\nAdios!'

new_file_name = 'datame2025.txt'
new_file = open(file_path + new_file_name, 'w')
new_file.write(data)
new_file.close()

new_file = open(file_path + new_file_name, 'r')
data = new_file.read() 
print(data)
new_file.close()


# Archivos csv

file_name = 'cronograma_sugerido.csv'

asignaturas = []

with open(file_path + file_name, 'rt') as file:
    clases = next(file)
    clases = clases.split(',')
    for line in file:
        datos_linea = line.split(',')
        asignaturas.append(datos_linea[1])
        # print(datos_linea[1])
        
print(clases[1] + ':', asignaturas)


######################

# Ejercicios

# 1
import random

def generala_tirar():
    nums = []
    for i in range(5):
        nums.append(random.randint(1, 6))
        
    count = [0]*6
    for i in range(5):
        count[nums[i] - 1] += 1
        
    uniques = []
    for i in range(6):
        if count[i] != 0:
            uniques.append(count[i])
            
    if len(uniques) == 1:
        print('Generala')
    if len(uniques) == 2:
        if count[0] == 4 or count[1] == 4:
            print('Poker')
        else:
            print('Full')
    else:
        print('Nada')
        
    return nums
    
generala_tirar()



# 2
with open(file_path + "datame.txt", 'r') as file:
    for line in file:
        if line.find('estudiante') != -1:
            print(line)
    
# 3
lista_materias = []

with open(file_path + 'cronograma_sugerido.csv') as file:
    next(file)
    for line in file:
        line_data = line.split(',')
        lista_materias.append(line_data[1])

# 4
def cuantas_materias(n):
    materias_cuatrimestre = 0
    
    with open(file_path + 'cronograma_sugerido.csv') as file:
        next(file)
        for line in file:
            line_data = line.split(',')
            if int(line_data[0]) == n:
                materias_cuatrimestre += 1
    
    return materias_cuatrimestre
                
print(cuantas_materias(8))
        
# 5
def materias_cuatrimestre(nombre_archivo, n):
    lista_dicc_materias = []
    
    with open(file_path + nombre_archivo) as file:
        encabezado = next(file)
        categorias = encabezado.split(',')
        print(categorias)
        for line in file:
            line_data = line.split(',')
            dicc_materia = {}
            for i in range(len(categorias)):    
                dicc_materia[categorias[i].strip('\n')] = line_data[i].strip('\n')
            lista_dicc_materias.append(dicc_materia)
            
    return lista_dicc_materias

materias_cuatrimestre('cronograma_sugerido.csv', 3)
    
######################

# Numpy
import numpy as np

#Ejercicio
def pisar_elemento(M,e):
    original_shape = M.shape
    M = M.reshape(-1)
    for i in range(len(M)):
        if M[i] == e:
            M[i] = -1
    M = M.reshape(original_shape)
    
M = np.arange(10)
M = M.reshape((2,5))
print(M)
pisar_elemento(M, 3)
print(M)       

# Pandas
import pandas as pd

file_name = 'cronograma_sugerido.csv'

df = pd.read_csv(file_path + file_name)
