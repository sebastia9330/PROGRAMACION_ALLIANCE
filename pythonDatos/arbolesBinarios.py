#Arbol Binario

class Tree:
    def __init__(self):
        self.root = None

    def add_node(self, valor):
        if self.root:
            self.root.add_node(valor)
        else:
            self.root = Nodo_tree(valor)

    def buscarValor(self, valor):
        print(f"Buscando valor {valor}")
        if self.root:
            self.root.buscarValor(valor)
        else:
            print("El valor no esta dentro del nodo")


class Nodo_tree:
    def __init__(self, valor):
        self.valor = valor
        self.izquierda = None
        self.derecha = None

    def add_node(self, valor):
        if valor < self.valor:
            #Insertar nodo de la izquierda
            if self.izquierda:
                self.izquierda.add_node(valor)
            else:
                self.izquierda = Nodo_tree(valor)
        elif valor > self.valor:
            #insertar nodo de la derecha
            if self.derecha:
                self.derecha.add_node(valor)
            else:
                self.derecha = Nodo_tree(valor)

    def buscarValor(self, valor):
        if valor == self.valor:
            print("Valor encontrado!")
        elif valor < self.valor:
            if self.izquierda:
                self.izquierda.buscarValor(valor)
            else:
                print("El valor no esta dentro del nodo")
        elif valor < self.valor:
            if self.derecha:
                self.derecha.buscarValor(valor)
            else:
                print("El valor no esta dentro del nodo")


arbol = Tree()

arbol.add_node(11)
arbol.add_node(32)
arbol.add_node(54)
arbol.add_node(76)
arbol.add_node(12)
arbol.add_node(33)
arbol.add_node(5)
arbol.add_node(7)

arbol.buscarValor(2)
