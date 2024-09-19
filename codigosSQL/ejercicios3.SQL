--1. Muestra todos los productos que tienen más de 100 unidades en stock. 
SELECT * FROM PRODUCTO WHERE cantidad_en_stock > 100;

--2. Muestra los empleados que trabajan en oficinas ubicadas en "Bogotá". 
SELECT * 
FROM EMPLEADO 
WHERE CODIGO_OFICINA IN(     
    SELECT CODIGO_OFICINA     
    FROM OFICINA     
    WHERE CIUDAD = 'BOGOTA' 
);

--3. Listar todos los nombres de productos y sus precios de venta. 
SELECT NOMBRE, PRECIO_VENTA 
FROM PRODUCTO;


--Consulta 4: Muestra los detalles de los pedidos junto con la información del cliente que realizó cada pedido.
SELECT P.CODIGO_PEDIDO, DP.CANTIDAD, C.NOMBRE_CLIENTE, c.apellido_contacto,dp.precio_unidad
FROM cliente C
JOIN PEDIDO P ON C.codigo_cliente = P.codigo_cliente
JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
WHERE DP.PRECIO_UNIDAD >20000;

--5 Obtener el nombre del cliente y el nombre del empleado de ventas para cada pedido.
SELECT C.NOMBRE_CLIENTE, E.NOMBRE AS NOMBRE_EMPLEADO , P.CODIGO_PEDIDO
FROM PEDIDO P
JOIN CLIENTE C ON P.CODIGO_CLIENTE = C.CODIGO_CLIENTE
JOIN EMPLEADO E ON C.CODIGO_EMPLEADO = E.CODIGO_EMPLEADO;

--Consulta 6: Muestra los nombres de los clientes que han realizado un pedido que se entregó después de la fecha esperada.
SELECT NOMBRE_CONTACTO, APELLIDO_CONTACTO
FROM cliente
WHERE CODIGO_CLIENTE IN
(SELECT CODIGO_CLIENTE
FROM pedido
WHERE FECHA_ENTREGA > FECHA_ESPERADA);

--7 Consulta 4: Muestra los detalles de los pedidos junto con la información del cliente que realizó cada pedido.
SELECT P.CODIGO_PEDIDO, DP.CANTIDAD, C.NOMBRE_CLIENTE, c.apellido_contacto,dp.precio_unidad
FROM cliente C
JOIN PEDIDO P ON C.codigo_cliente = P.codigo_cliente
JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
WHERE DP.PRECIO_UNIDAD >20000;

-- 8. Mostrar los nombres y números de teléfono de los clientes que tienen un límite de crédito mayor a 600,000.
SELECT NOMBRE_CLIENTE, TELEFONO,LIMITE_CREDITO
FROM CLIENTE
WHERE LIMITE_CREDITO < 600000;

--9. Listar los nombres de productos junto con el número de pedidos en los que han sido incluidos.
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, DP.CODIGO_PEDIDO, COUNT(DP.CODIGO_PEDIDO) AS CANTIDAD_PEDIDO
FROM PRODUCTO P
JOIN DETALLE_PEDIDO DP ON P.CODIGO_PRODUCTO = DP.CODIGO_PRODUCTO
GROUP BY P.CODIGO_PRODUCTO, P.NOMBRE, DP.CODIGO_PEDIDO
ORDER BY P.CODIGO_PRODUCTO;

--10. Mostrar el total de pagos realizados por cada cliente, ordenados de mayor a menor. 
SELECT C.CODIGO_CLIENTE, C.NOMBRE_CLIENTE, SUM(P.TOTAL) AS TOTAL_PAGOS 
FROM PAGO P 
JOIN CLIENTE C ON P.CODIGO_CLIENTE = C.CODIGO_CLIENTE 
GROUP BY C.CODIGO_CLIENTE, C.NOMBRE_CLIENTE 
ORDER BY TOTAL_PAGOS DESC;

--11. Encontrar los nombres de los empleados que no tienen asignado ningún cliente.
SELECT E.NOMBRE, E.APELLIDO1, E.APELLIDO2
FROM EMPLEADO E
LEFT JOIN CLIENTE C ON E.CODIGO_EMPLEADO = C.CODIGO_EMPLEADO
WHERE C.CODIGO_EMPLEADO IS NULL;

--12. Mostrar la ciudad y el país de las oficinas junto con el número de empleados que trabajan en cada oficina.
SELECT O.CIUDAD, O.PAIS, COUNT(E.CODIGO_OFICINA) AS CANTIDAD_EMPLEADOS
FROM OFICINA O
LEFT JOIN EMPLEADO E ON O.CODIGO_OFICINA = E.CODIGO_OFICINA
GROUP BY O.CIUDAD, O.PAIS;

--1. Consulta: todos los detalles de los clientes en la tabla CLIENTE.
SELECT *
FROM CLIENTE;

--2. Consulta: Muestra el nombre y precio de los productos que tienen un precio de venta superior a 50.
SELECT NOMBRE, PRECIO_VENTA
FROM PRODUCTO
WHERE PRECIO_VENTA> 50;

--3. Consulta: Muestra el número de pedidos agrupados por su estado (ESTADO).
SELECT ESTADO, COUNT(*) AS TOTAL_PEDIDOS
FROM PEDIDO
WHERE ESTADO = ('ENTREGADO')
GROUP BY ESTADO;

--4. Consulta: Muestra el nombre y apellido de los empleados, junto con la ciudad en la que se encuentra su oficina.
SELECT E.NOMBRE, E.APELLIDO1, E.APELLIDO2, O.CIUDAD
FROM EMPLEADO E
JOIN OFICINA O
ON E.CODIGO_OFICINA = O.CODIGO_OFICINA;

--5. Consulta: Muestra el nombre del cliente y su límite de crédito si es mayor a 10,000.
SELECT NOMBRE_CLIENTE, LIMITE_CREDITO 
FROM CLIENTE
WHERE LIMITE_CREDITO > 10000;

--6. Consulta: Muestra los nombres de los productos que no aparecen en la tabla DETALLE_PEDIDO.
SELECT NOMBRE
FROM PRODUCTO P
WHERE NOT EXISTS (
SELECT *
FROM DETALLE_PEDIDO DP
WHERE DP.CODIGO_PRODUCTO = P.CODIGO_PRODUCTO);

--7. Consulta: Muestra el nombre del cliente y el total de pagos que ha realizado.
SELECT NOMBRE_CLIENTE, SUM (TOTAL) AS TOTAL_PAGOS
FROM CLIENTE C
JOIN PAGO P
ON C.CODIGO_CLIENTE = P.CODIGO_CLIENTE
GROUP BY NOMBRE_CLIENTE;

--8. Consulta: Muestra el nombre de los empleados que no han gestionado ningún pedido (no aparecen como CODIGO_EMPLEADO en la tabla CLIENTE)
SELECT NOMBRE, APELLIDO1, APELLIDO2 
FROM EMPLEADO E
WHERE NOT EXISTS (
SELECT *
FROM CLIENTE C
WHERE C.CODIGO_EMPLEADO = E.CODIGO_EMPLEADO );

--9. Consulta: Muestra los códigos de pedido que contienen más de 3 productos diferentes.
SELECT CODIGO_PEDIDO, COUNT(*) AS TOTAL_PRODUCTO_CODIGO
FROM DETALLE_PEDIDO
GROUP BY CODIGO_PEDIDO
HAVING COUNT(*)>3;

--10. Consulta: Muestra el nombre del cliente y el valor total de sus pedidos, pero solo si el valor total supera los $500.
SELECT C.NOMBRE_CLIENTE, SUM(DP.CANTIDAD * PRECIO_UNIDAD) AS VALOR_TOTAL_PEDIDOS
FROM CLIENTE C
JOIN PEDIDO P 
ON C.CODIGO_CLIENTE = P.CODIGO_CLIENTE
JOIN DETALLE_PEDIDO DP
ON P.CODIGO_PEDIDO = DP.CODIGO_PEDIDO
GROUP BY C.NOMBRE_CLIENTE
HAVING SUM(DP.CANTIDAD * PRECIO_UNIDAD) > 500;
