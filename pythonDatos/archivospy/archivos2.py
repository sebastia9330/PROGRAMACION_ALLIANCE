def cambio_datos(datos):
    list = [
    ("{0:05d}".format(datos[0])),
    (datos[1]),
    ("".join(datos[2].split("/"))),
    ("".join(datos[3].split(":"))),
    ]

    str_list = "".join(list)
    return str_list
    

def funListaNueva(data_in):
    lst_out = [
        int(data_in[0:5]),
        data_in[5:6],
        "/".join([data_in[6:8],data_in[8:11],data_in[11:15]]),
        ":".join([data_in[15:17],data_in[17:19],data_in[19:21]])
    ]
    print(lst_out)



datos = [10, "e", "23/ABR/2025", "10:20:35"]

str_datos = cambio_datos(datos)

with open("str_datos.txt", "w") as outfile:
    outfile.write(str_datos)

with open("str_datos.txt", "r") as inf:
    data_in = inf.read()

print(data_in)

funListaNueva(data_in)