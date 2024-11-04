librosCantidad = int(input("Digita la cantidad de libros: "))
precioPromedio = float(input("Digita el precio promedio de tus libros: "))
libroFavorito = input("Digita el nombre de tu libro favorito: ")

costoTotal = librosCantidad * precioPromedio
print(f"El costo total de los libros es: {costoTotal}")

print(f"Mi libro favorito es {libroFavorito}, y tengo {librosCantidad} libros en total.")