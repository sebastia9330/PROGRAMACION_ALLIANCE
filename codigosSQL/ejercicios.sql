--Consulta: Muestra el nombre de los clientes y su límite de crédito para aquellos cuyo límite de crédito sea mayor a 10,000.
SELECT NOMBRE_CLIENTE, APELLIDO_CONTACTO
FROM CLIENTE
WHERE LIMITE_CREDITO > 550000;

--Consulta: Encuentra el promedio de PRECIO_VENTA de todos los productos en la tabla PRODUCTO.
SELECT AVG(PRECIO_VENTA)
FROM PRODUCTO;

--Consulta: Muestra los nombres y apellidos de los empleados ordenados por apellido en orden ascendente.
SELECT NOMBRE , APELLIDO1, APELLIDO2
FROM EMPLEADO
ORDER BY APELLIDO1 ASC;

--Consulta: Muestra el nombre de los productos que tienen un precio de venta mayor a 200 y una cantidad en stock menor a 50.
SELECT NOMBRE, CANTIDAD_EN_STOCK, PRECIO_VENTA
FROM PRODUCTO
WHERE PRECIO_VENTA > 25000 AND CANTIDAD_EN_STOCK < 70;

--Consulta: Muestra el nombre del cliente, el código de pedido y la fecha de pedido para todos los pedidos realizados por los clientes.
SELECT NOMBRE_CLIENTE, CODIGO_PEDIDO, FECHA_PEDIDO
FROM CLIENTE
INNER JOIN PEDIDO ON CLIENTE.CODIGO_CLIENTE = PEDIDO.CODIGO_CLIENTE;

--Consulta: Muestra el nombre de cada oficina y el número total de empleados en cada oficina. Usa alias para las columnas.
SELECT OFICINA.CIUDAD AS NOMBRE_OFICINA,
    COUNT(EMPLEADO.CODIGO_EMPLEADO) AS TOTAL_EMPLEADOS
FROM OFICINA
JOIN EMPLEADO ON OFICINA.CODIGO_OFICINA = EMPLEADO.CODIGO_OFICINA
GROUP BY OFICINA.CIUDAD;

--Consulta: Encuentra los empleados que trabajan en la misma oficina donde trabaja el empleado con el nombre 'Juan'.
SELECT *
FROM EMPLEADO
WHERE CODIGO_OFICINA = (
    SELECT CODIGO_OFICINA
    FROM EMPLEADO
    WHERE NOMBRE = 'Sergio'
)
ORDER BY NOMBRE DESC;

--Muestra el código de producto y el total de cantidad vendida de cada producto (usa la tabla 
--DETALLE_PEDIDO para calcular esto). Agrupa los resultados por código de producto.
SELECT DETALLE_PEDIDO.CODIGO_PRODUCTO, SUM(CANTIDAD) AS TOTAL_CANTIDAD_VENDIDA
FROM DETALLE_PEDIDO
GROUP BY CODIGO_PRODUCTO;

SELECT 
    P.CODIGO_PRODUCTO,
    P.NOMBRE,
    SUM(DP.CANTIDAD) AS total_cantidad_vendida
FROM 
    PRODUCTO P
JOIN 
    DETALLE_PEDIDO DP ON P.CODIGO_PRODUCTO = DP.CODIGO_PRODUCTO
GROUP BY 
    P.CODIGO_PRODUCTO,
    P.NOMBRE;
    
--Consulta: Muestra el nombre del empleado, el nombre del cliente y el código de pedido para cada pedido. Involucra las tablas 
--EMPLEADO, CLIENTE, y PEDIDO.
SELECT 
    E.NOMBRE AS nombre_empleado,
    C.NOMBRE_CLIENTE AS nombre_cliente,
    P.CODIGO_PEDIDO AS codigo_pedido
FROM 
    PEDIDO P
JOIN 
    CLIENTE C ON P.CODIGO_CLIENTE = C.CODIGO_CLIENTE
JOIN 
    EMPLEADO E ON C.CODIGO_EMPLEADO = E.CODIGO_EMPLEADO;
    
    
--Consulta: Muestra los códigos de pedido y las fechas de entrega de aquellos pedidos cuya fecha de entrega sea mayor a la fecha actual.
SELECT
    CODIGO_PEDIDO,
    FECHA_ENTREGA
FROM
    PEDIDO
WHERE
    FECHA_ENTREGA > SYSDATE;
    
    
UPDATE PEDIDO
SET FECHA_ENTREGA = '09/09/2024'
WHERE CODIGO_PEDIDO = 2058;

-- Muestra los nombres de los productos y su precio de venta, ordenados de mayor a menor precio.

SELECT NOMBRE,PRECIO_VENTA
FROM PRODUCTO
ORDER BY PRECIO_VENTA DESC;

--Encuentra el nombre del cliente y el límite de crédito de aquellos clientes que tienen un empleado asignado (CODIGO_EMPLEADO es 1009).
SELECT NOMBRE_CLIENTE, NOMBRE_CONTACTO, APELLIDO_CONTACTO
FROM CLIENTE
WHERE CODIGO_EMPLEADO = NULL;

--Muestra el nombre de la ciudad y el número total de pedidos realizados por cada oficina. Usa una unión entre las tablas OFICINA y PEDIDO.
SELECT OFICINA.CIUDAD, COUNT(PEDIDO.CODIGO_PEDIDO) AS TOTAL_PEDIDOS
FROM OFICINA
JOIN EMPLEADO ON OFICINA.CODIGO_OFICINA = EMPLEADO.CODIGO_OFICINA
JOIN CLIENTE ON EMPLEADO.CODIGO_EMPLEADO = CLIENTE.CODIGO_EMPLEADO
JOIN PEDIDO ON CLIENTE.CODIGO_CLIENTE = PEDIDO.CODIGO_CLIENTE
GROUP BY OFICINA.CIUDAD;

--Muestra los nombres de los empleados que no tienen un código de oficina asignado (CODIGO_OFICINA es NULL).
SELECT NOMBRE
FROM EMPLEADO
WHERE CODIGO_OFICINA = NULL;

--Encuentra los productos que no han sido vendidos. Muestra su código y nombre. (Tip: usa una subconsulta con la tabla DETALLE_PEDIDO).
SELECT
    CODIGO_PRODUCTO,
    NOMBRE
FROM
    PRODUCTO
WHERE
    CODIGO_PRODUCTO NOT IN (
        SELECT CODIGO_PRODUCTO
        FROM DETALLE_PEDIDO
);


--Muestra el nombre y apellido de los empleados y el nombre de su oficina correspondiente.
--Si un empleado no tiene oficina asignada, muestra "Sin Oficina" en su lugar.
SELECT E.NOMBRE, E.APELLIDO1, E.APELLIDO2, O.CIUDAD
FROM EMPLEADO E
LEFT JOIN OFICINA O ON E.CODIGO_OFICINA = O.CODIGO_OFICINA;

--Muestra los códigos de pedido y las fechas de pedido de aquellos pedidos que se realizaron en los últimos 30 días.
SELECT CODIGO_PEDIDO, FECHA_PEDIDO
FROM PEDIDO
WHERE FECHA_PEDIDO >= SYSDATE - 30;

--Encuentra el nombre del cliente y el total pagado por cada cliente. Usa la tabla PAGO para calcular el total pagado.
SELECT C.NOMBRE_CLIENTE, C.APELLIDO_CONTACTO, SUM(P.TOTAL)
FROM CLIENTE C
JOIN PAGO P ON C.CODIGO_CLIENTE = P.CODIGO_CLIENTE
GROUP BY C.CODIGO_CLIENTE, C.NOMBRE_CLIENTE, c.apellido_contacto;


--Muestra el nombre de los empleados y la cantidad total de pedidos que han gestionado. Ordena el resultado 
--por la cantidad de pedidos en orden descendente.
SELECT E.NOMBRE, E.APELLIDO1, E.APELLIDO2, COUNT(P.CODIGO_PEDIDO) AS TOTAL_PEDIDOS
FROM EMPLEADO E
JOIN CLIENTE C ON E.CODIGO_EMPLEADO = C.CODIGO_EMPLEADO
JOIN PEDIDO P ON C.CODIGO_CLIENTE = P.CODIGO_CLIENTE
GROUP BY E.NOMBRE, E.APELLIDO1, E.APELLIDO2
ORDER BY TOTAL_PEDIDOS DESC;

--Muestra los nombres de los productos que tienen más de 5 líneas de detalle de pedido (esto es, han sido pedidos más de 5 veces).
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, COUNT(CANTIDAD) AS PEDIDO_MAS
FROM PRODUCTO P
JOIN DETALLE_PEDIDO DP ON P.CODIGO_PRODUCTO = DP.CODIGO_PRODUCTO
GROUP BY P.CODIGO_PRODUCTO, P.NOMBRE
HAVING COUNT(CANTIDAD) <= 10;


--28/11/24
-- Encuentra los productos que tienen un precio mayor al promedio de los productos en su misma categoría.
SELECT NOMBRE_PRODUCTO, CATEGORIA, AVG(PRECIO) AS MAYOR_PRECIO
FROM PRODUCTOS
GROUP BY NOMBRE_PRODUCTO, CATEGORIA
HAVING MAYOR_PRECIO > AVG(PRECIO);
-- CORRECCION
SELECT NOMBRE_PRODUCTO, CATEGORIA, PRECIO
FROM PRODUCTOS P
WHERE PRECIO > (
    SELECT AVG(PRECIO)
    FROM PRODUCTOS
    WHERE CATEGORIA = P.CATEGORIA
);


-- Calcula el monto promedio de las ventas, pero muestra solo aquellas superiores al promedio.
SELECT ID_VENTA, AVG(MONTO) AS PROMEDIO
FROM VENTAS
WHERE PROMEDIO > AVG(MONTO);
--CORRECION
SELECT ID_VENTA, MONTO
FROM VENTAS
WHERE MONTO > (SELECT AVG(MONTO) FROM VENTAS);


-- Calcula cuántos años lleva cada empleado en la empresa.
SELECT NOMBRE, MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) AS ANTIGUEDAD
FROM EMPLEADOS
--CORRECCION
SELECT NOMBRE, ROUND(MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) / 12, 1) AS ANTIGUEDAD
FROM EMPLEADOS;


--Encuentra a los empleados que tienen más de 5 años en la empresa.
SELECT NOMBRE, MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) AS ANTIGUEDAD
FROM EMPLEADOS
WHERE ANTIGUEDAD > 5;
--CORRECCION
SELECT NOMBRE, ROUND(MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) / 12, 1) AS ANTIGUEDAD
FROM EMPLEADOS
WHERE ROUND(MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) / 12, 1) > 5;


--Calcula un bono del 10% del salario para aquellos con más de 5 años.
SELECT NOMBRE, MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) AS ANTIGUEDAD, SUM(SALARIO + (SALARIO 0.1))
FROM EMPLEADOS
WHERE ANTIGUEDAD > 5;
-- CORRECCION
SELECT NOMBRE, 
        ROUND(MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) / 12, 1) AS ANTIGUEDAD,
        SALARIO + (SALARIO * 0.1) AS SALARIO_CON_BONO
FROM EMPLEADOS
WHERE ROUND(MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) / 12, 1) > 5;


-- Encuentra el cliente con el monto total más alto en transacciones.
SELECT CLI.NOMBRE, MAX(TRA.MONTO)
FROM CLIENTES CLI
JOIN TRANSACCIONES TRA ON CLI.ID_CLIENTE = TRA.ID_CLIENTE;

-- 29/11/24
--Usa una CTE para calcular el promedio de las ventas de cada cliente.
WITH CTE_VENTAS AS(
    SELECT ID_CLIENTE, AVG(MONTO) AS PROMEDIO
    FROM VENTAS
    GROUP BY ID_CLIENTE
)
SELECT CLI.NOMBRE, CTE.PROMEDIO
FROM CLIENTES CLI
JOIN CTE_VENTAS CTE ON CLI.ID_CLIENTE = CTE-ID_CLIENTE;