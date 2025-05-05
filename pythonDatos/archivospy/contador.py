#Contador para cuenta regresiva
#1. Tener una logica que me de la hora actual HH:MM:SS
#2. definir una fecha de finalizacion

from datetime import datetime
from time import sleep

PATH = "cuenta.txt"

def cero_adelante(numero):
    if numero < 10:
        return f"0{numero}"
    elif numero >= 10:
        return f"{numero}"

fecha_act = datetime.now()
fecha_fin = datetime.strptime("20:00:00", "%H:%M:%S")

while fecha_fin <= fecha_act:
    dif = fecha_fin - fecha_act

    #print(dif.seconds)

    horas = dif.seconds // 3600
    minutos = (dif.seconds // 60) % 60
    segundos = dif.seconds % 60

    dift_string = f"{cero_adelante(horas)}:{cero_adelante(minutos)}:{cero_adelante(segundos)}"
    print(dift_string)

    with open(PATH, "w") as f:
        f.write(dift_string)

    sleep(1)
    fecha_act = datetime.now()


