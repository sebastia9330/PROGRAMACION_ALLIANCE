nombre = input("Ingresa nombre del estudiante: ")
materia1 = input("Ingrese la materia #1: ").title()
creditos1 = int(input(f"Ingrese los creditos de la materia {materia1}: "))
totalCreditos = creditos1
totalHoras = totalCreditos * 1.25
print("="*50)
print("{:^50}".format("Reporte de: "))
print(f"{nombre.upper():^50}")
print("="*50)
print("{:^25}|{:^24}".format("Materia","Créditos"))
print("-"*50)
print("{:^25}|{:^24}".format(materia1,creditos1))
print("{:^25}|{:^24}".format(materia1,creditos1))
print("{:^25}|{:^24}".format(materia1,creditos1))
print("-"*50)
print("{:>24}|{:^23}".format("Total de Créditos: ",f"{totalCreditos:0>3}"))
print("{:>24}|{:^23}".format("Total de Horas: ", f"{totalHoras:.2f} horas"))