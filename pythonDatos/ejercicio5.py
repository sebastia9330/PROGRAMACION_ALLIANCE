import random
alumnos = []

for i in range(30):
    notas = [random.randint(1, 10) for i in range(3)]
    alumnos.append(notas)

print(alumnos)

promedios = []
for i in range(30):
    lista = alumnos[i]
    suma = 0
    for nota in lista:
        suma = nota + suma
    promedios.append(suma / 3)

print(promedios)