CREATE TABLE STG_SUCURSAL(
    CODIGO_SUCURSAL VARCHAR2(10),
    NOMBRE VARCHAR2(40),
    CIUDAD VARCHAR2(20),
    DIRECCION VARCHAR2(100),
    TELEFONO VARCHAR2(15)
);


CREATE TABLE STG_EMPLEADO(
    CODIGO_EMPLEADO VARCHAR2(10),
    NOMBRE VARCHAR2(50),
    APELLIDO1 VARCHAR2(50),
    TELEFONO VARCHAR2(15),
    CORREO VARCHAR2(100),
    PUESTO VARCHAR2(50)
);


CREATE TABLE STG_PRODUCTO(
    CODIGO_PRODUCTO VARCHAR2(10),
    NOMBRE VARCHAR2(40),
    MARCA VARCHAR2(25),
    PROVEEDOR VARCHAR2(25),
    DESCRIPCION VARCHAR2(150),
    CANTIDAD NUMBER(3),
    PRECIO_VENTA NUMBER(6),
    PRECIO_PROVEEDOR NUMBER(6)
);


CREATE TABLE STG_CLIENTE_D(
    CODIGO_CLIENTE VARCHAR2(10),
    cedula NUMBER(12),
    nombre VARCHAR2(30),
    apellido VARCHAR2(30),
    telefono VARCHAR2(15),
    direccion VARCHAR2(100),
    ciudad VARCHAR2(30)
);


CREATE TABLE STG_ESTADO_PEDIDO(
    CODIGO_PEDIDO VARCHAR2(10),
    ESTADO VARCHAR2(15),
);