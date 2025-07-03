import random


nCartas = [1,2,3,4,5,6,7,8,9,10,11,12]
nPalos = [0,1,2,3]


class Mazo():
    def __init__(self):
        self.cartas = []
        for palo in nPalos:
            for numero in nCartas:
                carta = Carta(numero, palo)
                self.cartas.append(carta)

        random.shuffle(self.cartas)
    
    def agarrar(self):
        return self.cartas.pop()

class Carta():
    def __init__(self, numero, palo):
        palos = ["espadas", "bastos", "oros", "copas"]
        self.numero = numero
        self.npalo = palo
        self.palo = palos[palo]

    def mostrar(self):
        print(f"{self.numero} de {self.palo}")


mazo = Mazo()

for carta in mazo.cartas:
    carta.mostrar()

carta = mazo.agarrar()

print(carta.mostrar())