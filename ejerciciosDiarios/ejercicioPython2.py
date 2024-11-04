# Parte 1: Comprobar si el número es par o impar
numero = int(input("Ingresa un número para comprobar si es par o impar: "))
if numero % 2 == 0:
    print(f"El número {numero} es par")
else:
    print(f"El número {numero} es impar")

# Parte 2: Imprimir números impares desde 1 hasta el número dado
print(f"Números impares desde 1 hasta {numero}:")
for x in range(1, numero + 1):
    if x % 2 != 0:
        print(x, end=", ")

print("\n")

# Parte 3: Bucle 'while' para continuar ingresando números hasta que sea 0
numero2 = int(input("Ingresa un número (para salir digita 0): "))
while numero2 != 0:
    if numero2 % 2 == 0:
        print(f"El número {numero2} es par")
    else:
        print(f"El número {numero2} es impar")
    # Pedir un nuevo número al usuario para continuar o salir
    numero2 = int(input("Ingresa otro número (para salir digita 0): "))

print("¡Gracias por participar!")
