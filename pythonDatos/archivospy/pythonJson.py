import json



with open("persona.json") as fi:
    persona = json.loads(fi.read())

print(persona["nombre"])
print(persona["hobbies"][1])
print(persona["hijos"][0])

dilza = {
    "nombre": "Dilza",
    "apellido": "Robles",
    "hobbies": ["leer","ver series", "auditoria"],
    "hijos": None
}

with open("persona.json","w") as fo:
    json.dump(dilza, fo)