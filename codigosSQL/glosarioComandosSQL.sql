--Borrar una columna
ALTER TABLE nombre_de_tabla DROP COLUMN nombre_de_columna;

--CAMBIAR EL NOMBRE DE UNA COLUMNA
ALTER TABLE nombre_de_tabla RENAME COLUMN nombre_viejo TO nombre_nuevo;

--modificar el tamaño de una columna
ALTER TABLE nombre_tabla
MODIFY nombre_columna VARCHAR2(nuevo_tamano);