deuda = 2000
iva = 0.12
valorACancelar =  deuda +  deuda * iva

print(f"Se tiene que pagar {valorACancelar}")

""" ancho = float(input("Ingrese el ancho del terreno: "))
alto = float(input("Ingrese el alto del terreno: "))
cantidadDeHijos = int(input("Ingrese la cantidad de hijos: "))
tamaño = ancho * alto
asignacion = tamaño/cantidadDeHijos
print(f"Cada hijo tiene asignado {asignacion}m cuadrados") """


""" numero = int(input("Ingrese un numero: "))
residuo = numero%2
esPar = residuo == 0
print(f"¿Es Par? {esPar}") """

""" numeroA = int(input("Ingrese A: "))
numeroB = int(input("Ingrese B: "))
residuo = numeroA % numeroB
esAdivisibleParaB = residuo == 0
print(f"¿Es divisible para B? {esAdivisibleParaB}") """

""" monto = int(input("Ingrese monto: "))
billetes100 = monto//100
residuo = monto%100
billetes20 = residuo//20
residuo = residuo%20
billetes5 = residuo//5
billetes1 = residuo%5
minimoBilletes = billetes100 + billetes20 + billetes5 + billetes1
print(f"Cantidad minima de billetes: {minimoBilletes}")
print(f"Billetes de 100: {billetes100}")
print(f"Billetes de 20: {billetes20}")
print(f"Billetes de 5: {billetes5}")
print(f"Billetes de 1: {billetes1}") """

""" digito = int(input("Ingrese el número: "))
num1 = digito%10
conciente = digito//10
num2 = conciente%10
conciente = conciente//10
num3 = conciente%10
ordenAsc = num3 < num2 < num1
ordenDes = num3 > num2 > num1
esOrdenado = ordenDes or ordenAsc
print(f"¿Es ordenado? {esOrdenado}") """

""" cantLados = int(input("Ingrese la cantidad de lados: "))
tamañoLado = float(input("Ingrese el tamaño de un lado: "))
perimetro = cantLados * tamañoLado
print(f"El perimetro es: {perimetro}") """

""" positivo = int(input("Ingresa un numero entero positivo: "))
resultado = (positivo * (positivo + 1))// 2
print(f"La suma de los {positivo} primeros enteros {resultado}")   
 """
a = 1
b = -8
c = 12
xmin = -b/2*a
ymin = xmin**2 - 8*xmin + 12
print(f"Punto: {xmin},{ymin}")

x1 = (-b+(b**2 - 4*a*c)**(1/2))/(2*a)
x2 = (-b-(b**2 - 4*a*c)**(1/2))/(2*a)
print(f"los cortes son: {x1},{x2}")