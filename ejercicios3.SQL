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