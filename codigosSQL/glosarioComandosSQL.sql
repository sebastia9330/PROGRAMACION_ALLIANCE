--Borrar una columna
ALTER TABLE nombre_de_tabla DROP COLUMN nombre_de_columna;

--CAMBIAR EL NOMBRE DE UNA COLUMNA
ALTER TABLE nombre_de_tabla RENAME COLUMN nombre_viejo TO nombre_nuevo;

--modificar el tamaño de una columna
ALTER TABLE nombre_tabla
MODIFY nombre_columna VARCHAR2(nuevo_tamano);

CREATE TABLE DULCES(
    ID_DULCE NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NOMBRE_DULCE VARCHAR2(20)
);

-- Paso 1: Eliminar la columna ID_DULCE
ALTER TABLE DULCES DROP COLUMN ID_DULCE;

-- Paso 2: Volver a agregar la columna ID_DULCE con `IDENTITY` reiniciado y sin caché
ALTER TABLE DULCES ADD (
    ID_DULCE NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCACHE)
);

-- AGREGAR COMENTARIO A UNA TABLA
COMMENT ON TABLE DIM_FUNCIONARIO IS 'Tabla de dimensiones que almacena información sobre funcionarios de la empresa';


-- REINICIAR UNA SECUENCIA EN EL NUMERO QUE QUEDO
ALTER SEQUENCE DULCERIA_SEQ RESTART START WITH 4;

--AGREGAR UNA COLUMNA
ALTER TABLE DULCERIA ADD FECHA_INICIO DATE;


-- VER EL HISTORIAL DE LA SECUANCIA
SELECT LAST_NUMBER
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'DULCERIA_SEQ';


--deshabilitar los indices
ALTER INDEX ALL ON TABLA DISABLE;

--rehabilitar los indices
ALTER INDEX ALL ON TABLA REBUILD;



INSERT INTO AUDITORIA_NULOS (CODIGO, FECHA_ENTREGA, FECHA_PEDIDO, FECHA_ESPERADA, FECHA_ERROR, COMENTARIO)
    SELECT codigo_pedido, fecha_entrega, fecha_pedido, fecha_esperada, SYSDATE, 'FECHA ENTREGA NULA' AS COMENTARIO
    FROM tab_pedido
    WHERE fecha_entrega IS NULL
    
    UNION ALL
    SELECT codigo_pedido, fecha_entrega, fecha_pedido, fecha_esperada, SYSDATE, 'FECHA PEDIDO NULA' AS COMENTARIO
    FROM tab_pedido
    WHERE fecha_pedido IS NULL
    
    UNION ALL
    SELECT codigo_pedido, fecha_entrega, fecha_pedido, fecha_esperada, SYSDATE, 'FECHA ESPERADA NULA' AS COMENTARIO
    FROM tab_pedido
    WHERE fecha_esperada IS NULL;



    -- Insertar datos en la tabla de auditoría
    INSERT INTO AUDITORIA_NULOS (Columna, CantidadNulos, CODIGO)
    SELECT 
        'FECHA_ENTREGA' AS Columna, COUNT(*) AS CantidadNulos, 'CODIGO_PEDIDO' AS CODIGO
    FROM TAB_PEDIDO
    WHERE FECHA_ENTREGA IS NULL

    UNION ALL

    SELECT 
        'FECHA_PEDIDO' AS Columna, COUNT(*) AS CantidadNulos, 'CODIGO_PEDIDO' AS CODIGO
    FROM TAB_PEDIDO
    WHERE FECHA_PEDIDO IS NULL

    UNION ALL

    SELECT 
        'FECHA_ESPERADA' AS Columna, COUNT(*) AS CantidadNulos, 'CODIGO_PEDIDO' AS CODIGO
    FROM TAB_PEDIDO
    WHERE FECHA_ESPERADA IS NULL

    SELECT *
FROM TAB_CLIENTE
WHERE REGEXP_LIKE(CIUDAD, '^[A-Za-zÁáÉéÍíÓóÚúÑñ\.\-]+( [A-Za-zÁáÉéÍíÓóÚúÑñ\.\-]+)*$'
);


-- creacion de usuario
CREATE USER DEVELOPER IDENTIFIED BY '123456'
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

-- permiso de coneccion
GRANT CONNECT, RESOURCE TO DEVELOPER;


--CREACION DE SECUANCIA
CREATE SEQUENCE DIM_CLIENTE
START WITH 1       -- Valor inicial
INCREMENT BY 1     -- Incremento en cada uso
NOCACHE;
