mi_dic = {"nombre": "Sebastián", "edad": 3, "verdad": True}

mi_dic["verdad"] = False

print(mi_dic)
print(mi_dic["nombre"])
print(mi_dic.get("apellido", "no hay"))

for value in mi_dic:
    print(value)

for key, value in mi_dic.items():
    print(f"{key}: {value}")

if "edad" in mi_dic:
    print("Si hay edad")

mi_dic["apellido"] = "Carrero"

print(mi_dic)