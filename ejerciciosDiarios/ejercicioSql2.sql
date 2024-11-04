1. SELECT COUNT(*)
FROM ESTUDIANTES;

2. SELECT AVG(PROMEDIO) AS PROMEDIO_TOTAL
FROM ESTUDIANTES;

3. SELECT CARRERA, COUNT(CARRERA)
FROM ESTUDIANTES
GROUP BY CARRERA;

4. SELECT CARRERA, AVG(PROMEDIO) AS PROMEDIO_CARRERA
FROM ESTUDIANTES
GROUP BY CARRERA;

5. SELECT CARRERA, AVG(PROMEDIO) AS PROMEDIO_CARRERA
FROM ESTUDIANTES
GROUP BY CARRERA
HAVING AVG(PROMEDIO) > 80;

-- LA DIFERENCIA ES QUE HAVING SOLO SE USA PARA FILTRAR AGRUPACIONES
