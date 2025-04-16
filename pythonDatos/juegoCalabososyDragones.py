import random

#Fuerza 
dado1 = random.randint(1,6)
dado2 = random.randint(1,6)
dado3 = random.randint(1,6)
dado4 = random.randint(1,6)


""" if(dado1 < dado2 and dado1 < dado3 and dado1 < dado4):
    suma = dado2 + dado3 + dado4
if(dado2 < dado1 and dado2 < dado3 and dado2 < dado4):
    suma = dado2 + dado3 + dado4
if(dado3 < dado1 and dado3 < dado2 and dado3 < dado4):
    suma = dado1 + dado2 + dado4
if(dado4 < dado1 and dado4 < dado3 and dado4 < dado2):
    suma = dado2 + dado3 + dado1 """



suma = dado1 + dado2 + dado3 + dado4
menor = min(dado1,dado2,dado3,dado4)

fuerza = suma - menor

print(f"Fuerza: {fuerza}")
#print(f"Dado1: {dado1}, Dado2: {dado2}, Dado3: {dado3}, Dado4: {dado4}")


#Destreza

dado1 = random.randint(1,6)
dado2 = random.randint(1,6)
dado3 = random.randint(1,6)
dado4 = random.randint(1,6)

suma = dado1 + dado2 + dado3 + dado4
menor = min(dado1,dado2,dado3,dado4)

destreza = suma - menor

print(f"destreza: {destreza}")

#Constitucion

dado1 = random.randint(1,6)
dado2 = random.randint(1,6)
dado3 = random.randint(1,6)
dado4 = random.randint(1,6)

suma = dado1 + dado2 + dado3 + dado4
menor = min(dado1,dado2,dado3,dado4)

constitucion = suma - menor

print(f"Constitución: {constitucion}")


#Inteligencia

dado1 = random.randint(1,6)
dado2 = random.randint(1,6)
dado3 = random.randint(1,6)
dado4 = random.randint(1,6)

suma = dado1 + dado2 + dado3 + dado4
menor = min(dado1,dado2,dado3,dado4)

inteligencia = suma - menor

print(f"Inteligencia: {inteligencia}")


#Sabiduria

dado1 = random.randint(1,6)
dado2 = random.randint(1,6)
dado3 = random.randint(1,6)
dado4 = random.randint(1,6)

suma = dado1 + dado2 + dado3 + dado4
menor = min(dado1,dado2,dado3,dado4)

sabiduria = suma - menor

print(f"Sabiduria: {sabiduria}")


#Carisma

dado1 = random.randint(1,6)
dado2 = random.randint(1,6)
dado3 = random.randint(1,6)
dado4 = random.randint(1,6)

suma = dado1 + dado2 + dado3 + dado4
menor = min(dado1,dado2,dado3,dado4)

carisma = suma - menor

print(f"Carisma: {carisma}")