-- 1. Listar los nombres de productos cuyo precio de venta sea mayor a 25000.
SELECT NOMBRE
FROM PRODUCTO
WHERE PRECIO_VENTA > 25000;

--2. Mostrar el nombre completo (nombre y apellidos) de todos los empleados que trabajan en la oficina cuyo código es 1.
SELECT E.NOMBRE, E.APELLIDO1, E.APELLIDO2
FROM EMPLEADO E
JOIN OFICINA O ON E.CODIGO_OFICINA = O.CODIGO_OFICINA
WHERE O.CODIGO_OFICINA = 1;

--1. Insertar un nuevo producto: Agrega un producto nuevo en la tabla PRODUCTO.
INSERT INTO PRODUCTO VALUES('HEM0061','IMPRESORA','50X20X30 CM','EPSON','IMPRESORA PARA SUBLIMAR',35,550000,500000);

--2. Eliminar un cliente: Borra un cliente de la tabla CLIENTE.
DELETE CLIENTE
WHERE CODIGO_CLIENTE = 1061;

--3. Insertar un nuevo pedido: Registra un nuevo pedido para un cliente existente en la tabla PEDIDO.
INSERT INTO PEDIDO VALUES (2061,'04/09/2024','09/09/2024',NULL,'PENDIENTE','Pedido en bodega','1060');

--3. Actualizar la cantidad en stock de un producto: Reduce en 5 unidades la cantidad de un producto específico.
UPDATE PRODUCTO
SET CANTIDAD_EN_STOCK = 95
WHERE CODIGO_PRODUCTO = 'HEM0001';