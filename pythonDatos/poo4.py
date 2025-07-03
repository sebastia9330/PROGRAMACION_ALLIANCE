p1 = 10
p2 = [4,3,2,1,0,-1,-2,-3,-4]

for num in p2:
    print(p1/num)


class AlumnoHistorico:
    #clase para manejar el historico de alumnos
    def get_prom(notas):
        #funcion que recibe una lista de notas, calcula el promedio 
        #y devuelve la lista con el promedio agregado

        prom = 0
        for nota in notas:
            prom = prom + int(nota)
        return prom / len(notas)
    
    def append_historico(self, year):
        self.year = year
        self.self.fn_actual = f"notas_{year}.csv"

        with open(self.fn_actual, "r") as inf:
            notas_str = inf.read()
            notas_lst = notas_str.split("\n")

            proms = []
            for alumno_notas_str in notas_lst:
                alumno_notas = alumno_notas_str.split(",")
                notas = alumno_notas[1:]
                alumno_notas.append(self.get_prom(notas))
                proms.append(alumno_notas)

            print(proms)