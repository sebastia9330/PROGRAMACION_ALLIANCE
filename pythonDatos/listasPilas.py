"""
Estructuras de datos copadas
"""

class Lista_se:
    """
    Cabeza de la lista simplemente enlazada
    """
    def __init__(self):
        self.nodo = None

    def agregar(self, valor):
        if self.nodo:
            self.nodo.agregar(valor)
        else:
            self.nodo = Nodo_se(valor)

    def listar(self):
        return self.nodo.listar()

    def size(self):
        if self.nodo:
            return self.nodo.size()
        else:
            return 0

    def ordenar(self):
        if self.nodo:
            ordenando = True
            while ordenando:
                ordenando = self.nodo.ordenar()

class Nodo_se:
    """
    Nodo de la lista simplemente enlazada
    """
    def __init__(self, valor):
        self.valor = valor
        self.next = None

    def agregar(self, valor):
        if self.next:
            self.next.agregar(valor)
        else:
            self.next = Nodo_se(valor)

    def listar(self):
        if self.next:
            seguiente = self.next.listar()
        else:
            return self.valor

        return f"{self.valor} {seguiente}"

    def size(self):
        if self.next:
            elemento = 1
            return elemento + self.next.size()
        else:
            return 0
    
    def ordenar(self):
        if self.next:
            if self.valor > self.next.valor:
                change = self.valor
                self.valor = self.next.valor
                self.next.valor = change
                self.next.ordenar()
                return True
            else:
                return self.next.ordenar()
        else:
            return False

class Stack:
    def __init__(self):
        self.nodo = None
    
    def push(self,valor):
        if self.nodo:
            new = Nodo_stack(valor,self.nodo)
            self.nodo = new
        else:
            self.nodo = Nodo_stack(valor,None)
        
    def pop(self):
        if self.nodo:
            valor = self.nodo.valor

            if self.nodo.next:
                self.nodo = self.nodo.next
            else:
                self.nodo = None

            return valor
        else:
            print("Lista vacia")

    def listar(self):
        return self.nodo.listar()
    
    
class Nodo_stack:
    def __init__(self, valor, next):
        self.valor = valor
        self.next = next

    def listar(self):
        if self:
            if self.next:
                seguiente = self.next.listar()
            else:
                return self.valor
            return f"{seguiente} {self.valor}"
        else:
            return "Lista vacia"


if __name__ == "__main__":
    from random import randint
    """

    lista = Lista_se()

    for i in range(10):
        lista.agregar(randint(1,50))

    print(lista.listar())

    lista.ordenar()

    print(lista.listar())
    """

    pila = Stack()

    for i in range(10):
        pila.push(randint(1,50))

    print(pila.pop())