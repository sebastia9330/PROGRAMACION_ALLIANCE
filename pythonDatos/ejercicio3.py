""" frase = input("Digita la frase que desees: ")
vocal = input("Digita una vocal: ").lower()
frase_m = frase.lower()
frase_final = frase_m.replace(vocal,vocal.upper())
print(frase)
print(frase_m)
print(frase_final) """

""" numeroTel = input("Ingresa tu numero telefonico con prefijo: ")
guion = numeroTel.find("-")
prefijo = numeroTel[1:guion]
print(f"El Prefijo es: {prefijo}") """

fechaNacimiento = input("ingresa la fecha de nacimiento en dormato DIA/MES/AÑO/: ")
separador1 = fechaNacimiento.find("/")
separador2 = fechaNacimiento.find("/",separador1+1)

dia = fechaNacimiento[:separador1]
mes = fechaNacimiento[separador1+1:separador2]
año = fechaNacimiento[separador2+1:]
print(f"El dia {dia} del mes {mes} del año {año}")
