def my_func(nombre):
    print(f"hola, Soy {nombre}")

my_func("Sebastián")


def suma(a,b):
    res = a + b
    return "soy una suma" ,res


tipo, resultado = suma(95,35)

print(tipo)
print(resultado)


import random

def get_stast():
    dados = [random.randint(1,6) for i in range(4)]
    dados.sort()
    maxDados = dados[1:]
    return sum(maxDados)

stats = {
    "Fuerza": get_stast(),
    "destreza": get_stast(),
    "Constitución": get_stast(),
    "Inteligencia": get_stast(),
    "Sabiduria": get_stast(),
    "Carisma": get_stast(),
}

print(stats)