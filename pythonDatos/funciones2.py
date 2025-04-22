def change_var(b):
    b = 5
    print(b)

a = 20
print(a)
change_var(a)
print(a)


def change_var2(b):
    b = [5]
    print(b)

a = [20]
print(a)
change_var2(a)
print(a)

def change_var3(b):
    b.append(5)
    print(b)

a = [20]
print(a)
change_var3(a)
print(a)


def argumentos(*args):
    print(args)

argumentos("sebas", 3, "Dilza", 4, "Sam")


def kwargumentos(**kwargs):
    print(kwargs)

kwargumentos(primero="sebas", num=3, segundo="Dilza", par=4, hijo="Sam")


def suma(a,b):
    return a + b
def resta(a,b):
    return a - b
def mult(a,b):
    return a * b
def divi(a,b):
    return a / b

op = {
    "suma": suma,
    "resta": resta,
    "multiplicacion": mult,
    "division": divi,
}

print(op["suma"](2,3))
print(op["resta"](2,3))
print(op["multiplicacion"](2,3))
print(op["division"](2,3))