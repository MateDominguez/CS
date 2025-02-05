# -*- coding: utf-8 -*-
"""
Materia: Laboratorio de datos - FCEyN - UBA
Clase  : Clase SQL. Script clase. 
Autor  : Francisco Peix
Fecha  : 2025-02-03
"""

# Importamos bibliotecas
import pandas as pd
import duckdb as dd


#%%===========================================================================
# Importamos los datasets que vamos a utilizar en este programa
#=============================================================================

carpeta = "~/Downloads/GuiaPracticaSQL/"

grupoetario       = pd.read_csv(carpeta+"grupoetario.csv")
provincia      = pd.read_csv(carpeta+"provincia.csv")
tipoevento   = pd.read_csv(carpeta+"tipoevento.csv")
casos        = pd.read_csv(carpeta+"casos.csv")
departamento = pd.read_csv(carpeta+"departamento.csv")
#%%===========================================================================
#A. Consultas sobre una tabla
# %%
# a. Listar sólo los nombres de todos los departamentos que hay en la tabla
# departamento (dejando los registros repetidos).

consultaSQL = """
               SELECT descripcion 
               FROM departamento;
              """

dataframeResultado = dd.sql(consultaSQL).df() #Porque le indicamos que lo devuelva en un dataFrame


# %%
# b. Listar sólo los nombres de todos los departamentos que hay en la tabla
# departamento (eliminando los registros repetidos).

consultaSQL = """
               SELECT DISTINCT descripcion
               FROM departamento;
              """

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# c. Listar sólo los códigos de departamento y sus nombres, de todos los
# departamentos que hay en la tabla departamento

consultaSQL = """
               SELECT id, descripcion
               FROM departamento;
              """

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# d. Listar todas las columnas de la tabla departamento.

consultaSQL = """
               SELECT *
               FROM departamento;
              """

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# e. Listar los códigos de departamento y nombres de todos los departamentos
# que hay en la tabla departamento. Utilizar los siguientes alias para las
# columnas: codigo_depto y nombre_depto, respectivamente.

consultaSQL = """
               SELECT  id AS codigo_depto, descripcion AS nombre_depto
               FROM departamento;
              """

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# f. Listar los registros de la tabla departamento cuyo código de provincia es
# igual a 54

consultaSQL = """
               SELECT DISTINCT id
               FROM departamento
               WHERE id_provincia = 54;
              """

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# g. Listar los registros de la tabla departamento cuyo código de provincia es
# igual a 22, 78 u 86.

consultaSQL = """
               SELECT  *
               FROM departamento
               WHERE (
                   id_provincia = 22
                   OR id_provincia = 78
                   OR id_provincia = 86
                   )
              """

dataframeResultado = dd.sql(consultaSQL).df() 


# %%
# h. Listar los registros de la tabla departamento cuyos códigos de provincia se
# encuentren entre el 50 y el 59 (ambos valores inclusive).

consultaSQL = """
               SELECT  *
               FROM departamento
               WHERE (
                   id_provincia >= 50
                   AND id_provincia <= 59
                   )
              """

dataframeResultado = dd.sql(consultaSQL).df() 

#%%===========================================================================
#B. Consultas multitabla (INNER JOIN)
# %%
# a. Devolver una lista con los código y nombres de departamentos, asociados al
# nombre de la provincia al que pertenecen.

consultaSQL = """
               SELECT DISTINCT d.id AS codigo, d.descripcion AS nombre_dpto, p.descripcion  AS nombre_prov
               FROM departamento AS d
               INNER JOIN provincia AS p
               ON d.id_provincia = p.id
              """

dataframeResultado = dd.sql(consultaSQL).df() 



# %%
# b. Devolver los casos registrados en la provincia de “Chaco”.

infoChaco = dd.sql("""
               SELECT DISTINCT *
               FROM provincia
               WHERE descripcion = 'Chaco'
              """).df()
              
deptoChaco = dd.sql("""
               SELECT DISTINCT d.id, d.descripcion, d.id_provincia
               FROM departamento AS d
               INNER JOIN infoChaco AS ic
               ON d.id_provincia = ic.id
              """).df()
              
consultaSQL = """
               SELECT DISTINCT c.id, c.id_tipoevento, c.anio, c.semana_epidemiologica, c.id_depto, c.id_grupoetario, c.cantidad  
               FROM casos AS c
               INNER JOIN deptoChaco AS dc
               ON c.id_depto = dc.id
              """

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# c. Devolver aquellos casos de la provincia de “Buenos Aires” cuyo campo
# cantidad supere los 10 casos.

infoBsAs = dd.sql("""
               SELECT DISTINCT *
               FROM provincia
               WHERE descripcion = 'Buenos Aires'
              """).df()
              
deptoBsAs = dd.sql("""
               SELECT DISTINCT d.id, d.descripcion, d.id_provincia
               FROM departamento AS d
               INNER JOIN infoBsAs AS iBA
               ON d.id_provincia = iBA.id
              """).df()
              
consultaSQL = """
               SELECT DISTINCT c.id, c.id_tipoevento, c.anio, c.semana_epidemiologica, c.id_depto, c.id_grupoetario, c.cantidad  
               FROM casos AS c
               INNER JOIN deptoChaco AS dc
               ON c.id_depto = dc.id AND c.cantidad > 10
              """

dataframeResultado = dd.sql(consultaSQL).df() 

#%%===========================================================================
# C. Consultas multitabla (OUTER JOIN)
# %%
# a. Devolver un listado con los nombres de los departamentos que no tienen
# ningún caso asociado.

consultaSQL = """
               SELECT DISTINCT d.descripcion AS nombre_dpto
               FROM departamento AS d
               LEFT OUTER JOIN casos AS c
               ON d.id = c.id_depto
               WHERE c.id_depto IS NULL;
              """              

dataframeResultado = dd.sql(consultaSQL).df() 


# %%
# b. Devolver un listado con los tipos de evento que no tienen ningún caso
# asociado.

consultaSQL = """
               SELECT DISTINCT te.descripcion AS nombre_evento
               FROM tipoevento AS te
               LEFT OUTER JOIN casos AS c
               ON te.id = c.id_tipoevento
               WHERE c.id_depto IS NULL;
              """              

dataframeResultado = dd.sql(consultaSQL).df() 

#%%===========================================================================
# D. Consultas resumen
# %%
# a. Calcular la cantidad total de casos que hay en la tabla casos.

consultaSQL = """
               SELECT SUM(cantidad) AS cantCasosTotales
               FROM casos
              """              

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# b. Calcular la cantidad total de casos que hay en la tabla casos para cada año y
# cada tipo de caso. Presentar la información de la siguiente manera:
# descripción del tipo de caso, año y cantidad. Ordenarlo por tipo de caso
# (ascendente) y año (ascendente).

casosConEvento = dd.sql("""
               SELECT t.descripcion AS tipoCaso, c.anio, c.id, c.semana_epidemiologica, id_depto, id_grupoetario, c.cantidad
               FROM casos AS c
               INNER JOIN tipoevento AS t
               ON c.id_tipoevento = t.id
              """).df()
consultaSQL = """
               SELECT tipoCaso, anio, SUM(cantidad) as cantTotalCasos
               FROM casosConEvento
               GROUP BY tipoCaso, anio
               ORDER BY tipoCaso, anio ASC
              """              

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# c. Misma consulta que el ítem anterior, pero sólo para el año 2019.

casosConEvento = dd.sql("""
               SELECT t.descripcion AS tipoCaso, c.anio, c.id, c.semana_epidemiologica, id_depto, id_grupoetario, c.cantidad
               FROM casos AS c
               INNER JOIN tipoevento AS t
               ON c.id_tipoevento = t.id
              """).df()
consultaSQL = """
               SELECT tipoCaso, anio, SUM(cantidad) as cantTotalCasos
               FROM casosConEvento
               WHERE anio = 2019
               GROUP BY tipoCaso, anio
               ORDER BY tipoCaso, anio ASC
              """              

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# d. Calcular la cantidad total de departamentos que hay por provincia. Presentar
# la información ordenada por código de provincia.

consultaSQL = """
               SELECT id_provincia, COUNT(*) AS cantDeptos
               FROM departamento
               GROUP BY id_provincia
               ORDER BY id_provincia
              """              

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# e. Listar los departamentos con menos cantidad de casos en el año 2019.

deptosConCasos = dd.sql("""
               SELECT DISTINCT d.descripcion AS depto, c.anio, c.id, c.id_tipoevento, c.semana_epidemiologica, c.id_grupoetario, c.cantidad
               FROM casos AS c
               INNER JOIN departamento AS d
               ON c.id_depto = d.id
              """).df()


consultaSQL = """
               SELECT depto, SUM(cantidad) AS cantCasos
               FROM deptosConCasos
               WHERE anio = 2019
               GROUP BY depto, cantidad
               ORDER BY cantCasos ASC
              """              

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# f. Listar los departamentos con más cantidad de casos en el año 2020.

deptosConCasos = dd.sql("""
               SELECT DISTINCT d.descripcion AS depto, c.anio, c.id, c.id_tipoevento, c.semana_epidemiologica, c.id_grupoetario, c.cantidad
               FROM casos AS c
               INNER JOIN departamento AS d
               ON c.id_depto = d.id
              """).df()


consultaSQL = """
               SELECT depto, SUM(cantidad) AS cantCasos
               FROM deptosConCasos
               WHERE anio = 2020
               GROUP BY depto, cantidad
               ORDER BY cantCasos DESC
              """              

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# g. Listar el promedio de cantidad de casos por provincia y año.

deptosConCasos = dd.sql("""
               SELECT DISTINCT d.descripcion AS depto, c.anio, c.id, c.id_tipoevento, c.semana_epidemiologica, c.id_grupoetario, c.cantidad
               FROM casos AS c
               INNER JOIN departamento AS d
               ON c.id_depto = d.id
              """).df()
              
provinciaCasos = dd.sql("""
               SELECT DISTINCT d.id_provincia AS provincia, dc.anio, dc.id, dc.id_tipoevento, dc.semana_epidemiologica, dc.id_grupoetario, dc.cantidad
               FROM deptosConCasos AS dc
               INNER JOIN departamento AS d
               ON dc.depto = d.descripcion
              """).df()
              

consultaSQL = """
               SELECT provincia, anio, AVG(cantidad) AS promedioCasos
               FROM provinciaCasos
               GROUP BY provincia, anio
               ORDER BY provincia, anio
              """ 

dataframeResultado = dd.sql(consultaSQL).df()              

# %%
# h. Listar, para cada provincia y año, cuáles fueron los departamentos que más
# cantidad de casos tuvieron.

deptosConCasos = dd.sql("""
               SELECT DISTINCT d.descripcion AS depto, c.anio, c.id, c.id_tipoevento, c.semana_epidemiologica, c.id_grupoetario, c.cantidad
               FROM casos AS c
               INNER JOIN departamento AS d
               ON c.id_depto = d.id
              """).df()
              
provinciaCasos = dd.sql("""
               SELECT DISTINCT d.id_provincia AS provincia, dc.anio, dc.id, dc.id_tipoevento, dc.semana_epidemiologica, dc.id_grupoetario, dc.cantidad
               FROM deptosConCasos AS dc
               INNER JOIN departamento AS d
               ON dc.depto = d.descripcion
              """).df()              

consultaSQL = """
               SELECT provincia, anio, SUM(cantidad) AS cantCasos
               FROM provinciaCasos
               GROUP BY provincia, anio
               ORDER BY cantCasos DESC
              """ 

dataframeResultado = dd.sql(consultaSQL).df()   

# %%
# i. Mostrar la cantidad de casos total, máxima, mínima y promedio que tuvo la
# provincia de Buenos Aires en el año 2019.

deptosConCasos = dd.sql("""
               SELECT DISTINCT d.descripcion AS depto, c.anio, c.id, c.id_tipoevento, c.semana_epidemiologica, c.id_grupoetario, c.cantidad
               FROM casos AS c
               JOIN departamento AS d
               ON c.id_depto = d.id
              """).df()
              
provinciaCasos = dd.sql("""
               SELECT DISTINCT d.id_provincia, dc.anio, dc.id, dc.id_tipoevento, dc.semana_epidemiologica, dc.id_grupoetario, dc.cantidad
               FROM deptosConCasos AS dc
               JOIN departamento AS d
               ON dc.depto = d.descripcion
              """).df()              

consultaSQL = dd.sql("""
               SELECT pc.anio, pc.id_provincia, p.descripcion AS nombre_provincia, MAX(cantidad) AS maxCant, MIN(cantidad) AS minCant, AVG(cantidad) AS promCant
               FROM provinciaCasos AS pc
               INNER JOIN provincia AS p
               ON pc.id_provincia = p.id
               GROUP BY id_provincia, nombre_provincia, anio
              """).df()
              
consultaSQL = """
               SELECT *
               FROM datosProvincias
               WHERE anio = 2019
                   AND nombre_provincia = 'Buenos Aires'
              """               

dataframeResultado = dd.sql(consultaSQL).df()   

# %%
# j. Misma consulta que el ítem anterior, pero sólo para aquellos casos en que la
# cantidad total es mayor a 1000 casos.

deptosConCasos = dd.sql("""
               SELECT DISTINCT d.descripcion AS depto, c.anio, c.id, c.id_tipoevento, c.semana_epidemiologica, c.id_grupoetario, c.cantidad
               FROM casos AS c
               INNER JOIN departamento AS d
               ON c.id_depto = d.id
              """).df()
              
provinciaCasos = dd.sql("""
               SELECT DISTINCT d.id_provincia, dc.anio, dc.id, dc.id_tipoevento, dc.semana_epidemiologica, dc.id_grupoetario, dc.cantidad
               FROM deptosConCasos AS dc
               INNER JOIN departamento AS d
               ON dc.depto = d.descripcion
              """).df()              

datosProvincias = dd.sql("""
               SELECT pc.anio, pc.id_provincia, p.descripcion AS nombre_provincia, MAX(cantidad) AS maxCant, MIN(cantidad) AS minCant, AVG(cantidad) AS promCant, SUM(cantidad) AS canTotal
               FROM provinciaCasos AS pc
               INNER JOIN provincia AS p
               ON pc.id_provincia = p.id
               GROUP BY id_provincia, nombre_provincia, anio
              """).df()
              
consultaSQL = """
               SELECT *
               FROM datosProvincias
               WHERE canTotal > 1000
              """               

dataframeResultado = dd.sql(consultaSQL).df()   

# %%
# k. Listar los nombres de departamento (y nombre de provincia) que tienen
# mediciones tanto para el año 2019 como para el año 2020. Para cada uno de
# ellos devolver la cantidad de casos promedio. Ordenar por nombre de
# provincia (ascendente) y luego por nombre de departamento (ascendente).

deptosProvincia = dd.sql("""
               SELECT DISTINCT d.descripcion AS depto, p.descripcion AS provincia, d.id AS id_depto
               FROM departamento AS d
               INNER JOIN provincia AS p
               ON d.id_provincia = p.id 
              """).df()
              
deptosProvinciaCasos = dd.sql("""
               SELECT DISTINCT dp.depto, dp.provincia, c.anio, c.id, c.id_tipoevento, c.semana_epidemiologica, c.id_grupoetario, c.cantidad
               FROM casos AS c
               INNER JOIN deptosProvincia AS dp
               ON c.id_depto = dp.id_depto
              """).df()              

              
consultaSQL = """
               SELECT DISTINCT depto, provincia, AVG(cantidad) AS cantCasosProm
               FROM deptosProvinciaCasos AS dpc
               WHERE dpc.anio = 2019 
                   OR dpc.anio = 2020
               GROUP BY depto, provincia
               ORDER BY provincia, depto
              """               

dataframeResultado = dd.sql(consultaSQL).df() 

# %%
# l. Devolver una tabla que tenga los siguientes campos: descripción de tipo de
# evento, id_depto, nombre de departamento, id_provincia, nombre de
# provincia, total de casos 2019, total de casos 2020.

deptosProvincia = dd.sql("""
               SELECT DISTINCT d.id AS id_depto, d.descripcion AS depto, p.id AS id_provincia, p.descripcion AS provincia
               FROM departamento AS d
               INNER JOIN provincia AS p
               ON d.id_provincia = p.id 
              """).df()
              
casosConEvento = dd.sql("""
               SELECT DISTINCT te.descripcion AS tipoEvento, c.anio, c.id_depto, c.cantidad, 
               FROM casos AS c
               INNER JOIN tipoevento AS te
               ON c.id_tipoevento = te.id
              """).df()              

              
infoBuscada = dd.sql("""
               SELECT DISTINCT ce.tipoEvento, dp.id_depto, dp.depto, dp.id_provincia,  dp.provincia, ce.anio, SUM(ce.cantidad) AS totalCasos
               FROM deptosProvincia AS dp
               INNER JOIN casosConEvento AS ce
               ON dp.id_depto = ce.id_depto
               GROUP BY dp.depto, dp.provincia, ce.anio, ce.tipoEvento, dp.id_depto, dp.id_provincia
               ORDER BY dp.depto, ce.anio
              """).df()      

info2019 = dd.sql("""
               SELECT DISTINCT *
               FROM infoBuscada
               WHERE anio = 2019
              """).df()     
              
info2020 = dd.sql("""
               SELECT DISTINCT *
               FROM infoBuscada
               WHERE anio = 2020
              """).df()
              
consultaSQL = """
               SELECT DISTINCT i19.tipoEvento, i19.id_depto, i19.depto, i19.id_provincia,  dp.provincia, ce.anio, SUM(ce.cantidad)
               FROM deptosProvinciaCasos AS dpc
               WHERE dpc.anio = 2019 
                   OR dpc.anio = 2020
               GROUP BY depto, provincia
               ORDER BY provincia, depto
              """                             

dataframeResultado = dd.sql(consultaSQL).df() 
