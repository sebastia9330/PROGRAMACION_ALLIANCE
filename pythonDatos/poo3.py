#Herencia

class Mascota:
    def __init__(self, nombre):
        self.nombre = nombre

    def saludar(self):
        print(f"Hola mi nombre es {self.nombre}")

class Perro(Mascota):
    def saludar(self):
        print(f"Hola mi nombre es {self.nombre} y soy un perro")

class Gato(Mascota):
    def saludar(self):
        print(f"Hola mi nombre es {self.nombre} y soy un gato")

class Pajaro(Mascota):
    def saludar(self):
        print(f"Hola mi nombre es {self.nombre} y soy un pajaro")

p1 = Perro("Dog")
p2 = Gato("Fili")
p3 = Pajaro("loro")

p1.saludar()
p2.saludar()
p3.saludar()