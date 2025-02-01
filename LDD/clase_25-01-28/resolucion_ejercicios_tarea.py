#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jan 28 21:26:48 2025

@author: mateo
"""

# https://campus.exactas.uba.ar/pluginfile.php/51841/mod_resource/content/1/2025V1%20Practica-Clase01.pdf

import pandas as pd
import numpy as np
import requests

fpath = '/home/mateo/Documents/CS/LDD/clase_25-01-28/'

# Arbolado en espacios verdes

url = 'https://cdn.buenosaires.gob.ar/datosabiertos/datasets/ministerio-de-espacio-publico-e-higiene-urbana/arbolado-espacios-verdes/arbolado-en-espacios-verdes.csv'

response = requests.get(url)
fname = 'arbolado-en-parques.csv'

with open(fname, "wb") as f:
    f.write(response.content)

# 1
def read_park(fname, park):
    df = pd.read_csv(fpath + fname)
    df1 = df[df['espacio_ve'] == park]
    
    trees = []
    for row in df1.itertuples():    
        row = row[1:]
        tree = dict(zip(df1.columns, row))
        trees.append(tree)
            
    return trees
    
# park = 'GENERAL PAZ'
# read_park(file_parks, park)

# 2
def species(tree_list):
    species = set()
    
    for tree in tree_list:
        species.add(tree['nombre_com'])
    
    return list(species)

# 3
def count_specimens(tree_list):
    specimens_count = {}
    
    for tree in tree_list:
        tree_specie = tree['nombre_com']
        if tree['nombre_com'] in specimens_count.keys():
            specimens_count[tree_specie] += 1
        else:
            specimens_count[tree_specie] = 1
            
    return specimens_count

# count_specimens(trees)

# 4
def get_heights(tree_list, specie):
    heights = []
    for tree in tree_list:
        if tree['nombre_com'] == specie:
            heights.append(float(tree['altura_tot']))
            
    return heights

parks = ['GENERAL PAZ', 'LEZAMA', 'CENTENARIO']
specie= 'Jacarandá'

parks_data = {}
for park in parks:
    trees = read_park(fname, park)
    heights = get_heights(trees, specie)
    parks_data[park] = {'max': np.max(heights), 'prom': np.mean(heights)}


# datos_parques = pd.DataFrame(parks_data).round(2)

# 5
def get_inclinations(tree_list, specie):
    inclinations = []
    for tree in tree_list:
        if tree['nombre_com'] == specie:
            inclinations.append(float(tree['inclinacio']))
    return inclinations

# tree_list = read_park(fname, 'GENERAL PAZ')
# get_inclinations(tree_list, specie)
  
# 6
def most_inclined_specimen(tree_list):
    spcs = species(tree_list)
    spcs_inclinations = {}
    for specie in spcs:
        spcs_inclinations[specie] = get_inclinations(tree_list, specie)
        
    most_inclined = (None, 0)
    for specie in spcs_inclinations.keys():
        if max(spcs_inclinations[specie]) >= most_inclined[1]:
            most_inclined = (specie , max(spcs_inclinations[specie]))
            
    return most_inclined

inclinations = []
for park in parks:
    tree_list = read_park(fname, park)
    inclinations.append(most_inclined_specimen(tree_list))

# print(inclinations)    
  
# 7
def avarage_most_inclined_specie(tree_list):
    highest_avg_inclination = (None, 0)
    spcs = species(tree_list)
    
    for specie in spcs:
        inclinations = get_inclinations(tree_list, specie)
        if np.mean(inclinations) >= highest_avg_inclination[1]:
            highest_avg_inclination = (specie, float(np.mean(inclinations)))
    
    return highest_avg_inclination
    
# park = 'ANDES, LOS'
# avarage_most_inclined_specie(read_park(fname, park))
    
# Arbolado en veredas

df_parques = pd.read_csv(fname)

url = 'https://cdn.buenosaires.gob.ar/datosabiertos/datasets/atencion-ciudadana/arbolado-publico-lineal/arbolado-publico-lineal-2017-2018.csv'

response = requests.get(url)
fname = 'arbolado-en-veredas.csv'

with open(fname, "wb") as f:
    f.write(response.content)

df_veredas = pd.read_csv(fpath + fname, low_memory=False)

especies_seleccionadas = ['Tilia x moltkei', 'Jacaranda mimosifolia', 'Tipuana tipu']

df_arboles_parques = df_parques[['long', 'lat', 'altura_tot', 'diametro', 'nombre_cie']].copy()
df_arboles_parques = df_arboles_parques.replace({'nombre_cie': {'Tipuana Tipu': 'Tipuana tipu','Jacarandá mimosifolia': 'Jacaranda mimosifolia', 'Tilia viridis subsp. x moltkei': 'Tilia x moltkei'}})
df_arboles_parques['ambiente'] = 'parque'

df_arboles_veredas = df_veredas[['long', 'lat', 'nombre_cientifico', 'diametro_altura_pecho', 'altura_arbol']].copy()
df_arboles_veredas = df_arboles_veredas.rename(columns={'nombre_cientifico':'nombre_cie', 'diametro_altura_pecho': 'diametro', 'altura_arbol': 'altura_tot'})
df_arboles_veredas['ambiente'] = 'vereda'

df_arboles = pd.concat([df_arboles_parques, df_arboles_veredas], ignore_index=True)
    
diametros_especies = {}
for especie in especies_seleccionadas: 
    ambientes = ['parque', 'vereda']
    data_ambientes = {}
    df_especie = df_arboles[df_arboles['nombre_cie'] == especie]
    for ambiente in ambientes:
        diametros = df_especie[df_especie['ambiente'] == ambiente]['diametro']
        data_ambientes[ambiente] = {'diametro_max': np.max(diametros), 'diametro_prom': np.mean(diametros)}
    diametros_especies[especie] = data_ambientes.copy()
    data_ambientes.clear()


for especie in especies_seleccionadas:
    print(especie)
    print(pd.DataFrame(diametros_especies[especie]).round(2))
    print()