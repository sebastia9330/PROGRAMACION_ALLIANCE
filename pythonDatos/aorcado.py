#Juego del aorcado

vidas = 7
ganaste = False

palabra = input("Digita la palabra: ").lower()
print(palabra)

secreta = " ".join(["_" for letra in palabra])
letras = []

print(secreta)

while True:
    letra = input("Digita una letra: ").lower()

    if letra in palabra:
        letras.append(letra)
        secreta = " ".join([letra if letra in letras else "_" for letra in palabra])
        print(secreta)
        if len(letras) == len(secreta):
            print("GANASTE!!!!") 
            break
    else:
        vidas = vidas - 1
        print(f"{letra} no esta en la palabra")
        print(f"Te quedan {vidas} vidas")
        if vidas <= 0:
            print("Perdiste")
            break