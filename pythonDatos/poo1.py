class Perro:
    #nombre = "Lucas"
    #color = "Amarillo y Negro"
    #tamaño = "Mediano"

    def __init__(self, nombre, color, tamaño):
        self.nombre = nombre
        self.color = color
        self.tamaño = tamaño

    def dormir(self):
        print("Estoy Durmiendo")

    def hablar(self):
        print(f"hola mi nombre es {self.nombre}, tengo el pelo {self.color} y soy de tamaño {self.tamaño}")

    def saludar(self):
        print("hola")

p1 = Perro("lucas", "amarillo y negro", "mediano")

p1.hablar()

p2 = Perro("Firulais", "negro", "grande")

p2.hablar()
