
import random

with open("C:/Users/Nelson.Daza/Documents/Sebastian Carrero/PROGRAMACION_ALLIANCE/pythonDatos/archivospy/archivoCSV.csv") as fi:
    alumnos = []
    ln = fi.readline()
    while ln != "":
        alumnos.append(ln.replace("\n","").split(","))
        ln = fi.readline()

#primera forma
#alumnos_nuevos = []

#for alumno in alumnos:
#    alumno.append(random.randint(1,15))
#    alumnos_nuevos.append(alumno)

#print(alumnos_nuevos)

#segunda forma
[alumno.append(str(random.randint(1,15))) for alumno in alumnos]

alumnos_nuevos = [",".join(alumno) for alumno in alumnos]

alumnos_nuevos = "\n".join(alumnos_nuevos)


with open("alumnosNuevos.csv", "w") as fo:
    fo.write(alumnos_nuevos)