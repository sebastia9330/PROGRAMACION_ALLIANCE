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