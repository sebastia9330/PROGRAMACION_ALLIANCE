#programacion a objetos, nodos

class Nodo():
    def __init__(self, valor):
        self.valor = valor
        self.next = None
    
    def agregar(self, valor):
        if self.next:
            self.next.agregar(valor)
        else:
            self.next = Nodo(valor)

    def listar(self):    
        if self.next:
            siguiente = self.next.listar()
        else:
            return self.valor
        
        return f"{self.valor} {siguiente}"


lista = Nodo(6)

lista.agregar(5)
lista.agregar(4)
lista.agregar(3)
lista.agregar(2)
lista.agregar(1)

resultado = lista.listar()

print(resultado)
