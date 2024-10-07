CREATE TABLE FACT_VENTAS (
    CODIGO_PEDIDO NUMBER(11),
    CODIGO_PRODUCTO VARCHAR2(15),
    CANTIDAD NUMBER(11) NOT NULL,
    PRECIO_UNIDAD NUMBER(15,2) NOT NULL,
    NUMERO_LINEA NUMBER(15,2),
    TOTAL_VENTA NUMBER(15,2),
    CODIGO_CLIENTE NUMBER(11),
    FECHA_PEDIDO DATE,
    CODIGO_EMPLEADO NUMBER(11),
    CODIGO_OFICINA NUMBER(10),
    -- Claves foráneas
    CONSTRAINT FK_PRODUCTO FOREIGN KEY (CODIGO_PRODUCTO) REFERENCES DIM_PRODUCTO (CODIGO_PRODUCTO),
    CONSTRAINT FK_CLIENTE FOREIGN KEY (CODIGO_CLIENTE) REFERENCES DIM_CLIENTE (CODIGO_CLIENTE),
    CONSTRAINT FK_EMPLEADO FOREIGN KEY (CODIGO_EMPLEADO) REFERENCES DIM_EMPLEADO (CODIGO_EMPLEADO),
    CONSTRAINT FK_OFICINA FOREIGN KEY (CODIGO_OFICINA) REFERENCES DIM_OFICINA (CODIGO_OFICINA),
    CONSTRAINT FK_FECHA FOREIGN KEY (FECHA_PEDIDO) REFERENCES DIM_TIEMPO (FECHA)
);

CREATE TABLE DIM_PRODUCTO (
    CODIGO_PRODUCTO VARCHAR2(15) PRIMARY KEY,
    NOMBRE VARCHAR2(70),
    DIMENSIONES VARCHAR2(25),
    PROVEEDOR VARCHAR2(50),
    PRECIO_VENTA NUMBER(15,2),
    PRECIO_PROVEEDOR NUMBER(15,2)
);

CREATE TABLE DIM_CLIENTE (
    CODIGO_CLIENTE NUMBER(11) PRIMARY KEY,
    NOMBRE_CLIENTE VARCHAR2(50),
    NOMBRE_CONTACTO VARCHAR2(50),
    APELLIDO_CONTACTO VARCHAR2(50),
    TELEFONO VARCHAR2(15),
    REGION VARCHAR2(50),
    PAIS VARCHAR2(50)
);

CREATE TABLE DIM_EMPLEADO (
    CODIGO_EMPLEADO NUMBER(11) PRIMARY KEY,
    NOMBRE VARCHAR2(50),
    APELLIDO1 VARCHAR2(50),
    PUESTO VARCHAR2(50),
    CODIGO_OFICINA NUMBER(10),
    CONSTRAINT FK_OFICINA FOREIGN KEY (CODIGO_OFICINA) REFERENCES OFICINA (CODIGO_OFICINA)
);

CREATE TABLE DIM_OFICINA (
    CODIGO_OFICINA NUMBER(10) PRIMARY KEY,
    CIUDAD VARCHAR2(30),
    PAIS VARCHAR2(50),
    REGION VARCHAR2(50)
);


CREATE TABLE DIM_TIEMPO (
    FECHA DATE PRIMARY KEY,  
    DIA NUMBER(2),           
    MES NUMBER(2),           
    ANO NUMBER(4),           
    TRIMESTRE NUMBER(1)      
);


CREATE TABLE DIM_PEDIDO (
    CODIGO_PEDIDO NUMBER(11),
    CODIGO_PRODUCTO VARCHAR2(15),
    CANTIDAD NUMBER(11) NOT NULL,
    PRECIO_UNIDAD NUMBER(15,2) NOT NULL,
    NUMERO_LINEA NUMBER(15,2) NOT NULL,
    FECHA_PEDIDO DATE,
    FECHA_ESPERADA DATE,
    FECHA_ENTREGA DATE,
    ESTADO VARCHAR2(15),
    COMENTARIOS CLOB,
    CONSTRAINT FK_PRODUCTO FOREIGN KEY (CODIGO_PRODUCTO) REFERENCES PRODUCTO (CODIGO_PRODUCTO)
);