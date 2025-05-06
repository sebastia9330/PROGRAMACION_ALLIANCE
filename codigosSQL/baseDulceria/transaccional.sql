--#######################################################TABLA MARCA##########################

CREATE TABLE MARCA(
    CODIGO_MARCA NUMBER(2) PRIMARY KEY,
    MARCA VARCHAR(25)
)


INSERT ALL
    INTO MARCA(CODIGO_MARCA, MARCA) VALUES (1,'chocolates')
    INTO MARCA(CODIGO_MARCA, MARCA) VALUES (2,'gomas')
    INTO MARCA(CODIGO_MARCA, MARCA) VALUES (3,'caramelo')
    INTO MARCA(CODIGO_MARCA, MARCA) VALUES (4,'helados')
    INTO MARCA(CODIGO_MARCA, MARCA) VALUES (5,'chicle')
    INTO MARCA(CODIGO_MARCA, MARCA) VALUES (6,'energizante')
SELECT * FROM DUAL;

--########################## TABLA PRODUCTO ########################################
CREATE TABLE PRODUCTO(
    CODIGO_PRODUCTO VARCHAR2(10) PRIMARY KEY,
    NOMBRE VARCHAR(25),
    CODIGO_MARCA NUMBER(2),
    PROVEEDOR VARCHAR2(25),
    DESCRIPCION VARCHAR(150),
    CANTIDAD NUMBER(3),
    PRECIO_VENTA NUMBER(6),
    PRECIO_PROVEEDOR NUMBER(6),
    CONSTRAINT FK_MARCA FOREIGN KEY (CODIGO_MARCA) REFERENCES MARCA(CODIGO_MARCA)
);


INSERT ALL
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC001','Chocolatinas de fresa',1,'chocof','Tableta premium elaborada con granos seleccionados, perfecta para amantes del chocolate intenso,',10,2500,2000)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC002','Gomas de Frutas Tropicales',2,'gomafrut','Deliciosas gomitas suaves con sabores de mango, piña, maracuyá y coco,',15,3000,2500)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC003','Caramelo de leche',3,'carame','Caramelos suaves, ideales para disfrutar a cualquier hora,',20,3500,3000)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC004','Paletas de Fresa Artesanales',4,'helafrut','Paletas dulces elaboradas de forma tradicional con pulpa natural de fresa,',25,4000,3500)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC005','Chocolates Rellenos de Avellana',1,'chocof','Bombones cubiertos de chocolate con un corazón cremoso de avellana tostada,',30,4500,4000)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC006','Malvaviscos Gigantes',2,'gomafrut','Malvaviscos esponjosos de gran tamaño, perfectos para postres o asados,',35,5000,4500)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC007','Chicles de Menta',5,'chik','Chicles refrescantes de menta natural, ideales para una sensación fresca al instante,',40,5500,5000)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC008','Bombones de Chocolate Blanco',1,'chocof','Suaves bombones recubiertos de chocolate blanco, con un relleno dulce y sedoso,',45,6000,5500)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC009','Tableta de Chocolate con Mani',1,'chocof','Tableta de chocolate semiamargo combinada con almendras crocantes,',50,6500,6000)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC010','arequipe',3,'carame','Deliciosos bocados de leche caramelizada, elaborados siguiendo recetas tradicionales,',55,7000,6500)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC011','Caramelos Ácidos Variados',3,'carame','Caramelos de sabores intensos y ácidos como limón, mora y manzana verde,',60,7500,7000)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC012','Chocolatinas de Coco',1,'chocof','Delgadas chocolatinas rellenas de dulce de coco rallado,',65,8000,7500)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC013','Barras Energéticas de Frutas',6,'bolt','Barras naturales de frutos secos y frutas deshidratadas, perfectas para un snack saludable,',70,8500,8000)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC014','Gomitas Enrolladas Sabor Cereza',2,'gomafrut','Cintas de gomitas con sabor a cereza ácida, enrolladas en espiral,',75,9000,8500)
    INTO PRODUCTO(CODIGO_PRODUCTO,NOMBRE,CODIGO_MARCA,PROVEEDOR,DESCRIPCION,CANTIDAD_STOCK,PRECIO_VENTA,PRECIO_PROVEEDOR) VALUES ('DULC015','Turrón de Maní Artesanal',1,'chocof','Clásico turrón crujiente hecho con maní tostado y miel natural,',80,9500,9000)
SELECT * FROM DUAL;

--###########################################################TABLA SUCURSAL######################################
CREATE TABLE SUCURSAL(
    CODIGO_SUCURSAL VARCHAR2(10) PRIMARY KEY,
    NOMBRE VARCHAR2(40),
    CIUDAD VARCHAR2(20),
    DIRECCION VARCHAR(100),
    TELEFONO VARCHAR2(15)
);


INSERT ALL
    INTO SUCURSAL (codigo_sucursal,NOMBRE,CIUDAD,DIRECCION,TELEFONO) VALUES ('SUCU001','SUCURSAL CENTRO','Bogotá','Calle 72 #10-34','3245864032')
    INTO SUCURSAL (codigo_sucursal,NOMBRE,CIUDAD,DIRECCION,TELEFONO) VALUES ('SUCU002','Sucursal El Poblado','Medellín','Carrera 43A #7-50','3245864033')
    INTO SUCURSAL (codigo_sucursal,NOMBRE,CIUDAD,DIRECCION,TELEFONO) VALUES ('SUCU003','Sucursal Norte','Cali','Avenida 6 Norte #24N-35','3245864034')
    INTO SUCURSAL (codigo_sucursal,NOMBRE,CIUDAD,DIRECCION,TELEFONO) VALUES ('SUCU004','Sucursal Prado','Barranquilla','Calle 53 #46-192','3245864035')
    INTO SUCURSAL (codigo_sucursal,NOMBRE,CIUDAD,DIRECCION,TELEFONO) VALUES ('SUCU005','Sucursal Bocagrande','Cartagena','Avenida San Martín #7-21','3245864036')
    INTO SUCURSAL (codigo_sucursal,NOMBRE,CIUDAD,DIRECCION,TELEFONO) VALUES ('SUCU006','Sucursal Cabecera','Bucaramanga','Carrera 33 #48-05','3245864037')
    INTO SUCURSAL (codigo_sucursal,NOMBRE,CIUDAD,DIRECCION,TELEFONO) VALUES ('SUCU007','Sucursal Circunvalar','Pereira','Avenida Circunvalar #12-45','3245864038')
    INTO SUCURSAL (codigo_sucursal,NOMBRE,CIUDAD,DIRECCION,TELEFONO) VALUES ('SUCU008','sucursal Rodadero','Santa Marta','Carrera 1 #10-12, Rodadero','3245864039')
SELECT * FROM DUAL;

--###########################################TABLA EMPLEADOS##################################################
CREATE TABLE EMPLEADO (
    CODIGO_EMPLEADO VARCHAR2(10) PRIMARY KEY,
    NOMBRE VARCHAR2(50),
    APELLIDO1 VARCHAR2(50),
    TELEFONO VARCHAR2(15),
    CORREO VARCHAR2(100),
    CODIGO_SUCURSAL VARCHAR2(10),
    PUESTO VARCHAR2(50),
    CONSTRAINT FK_SUCURSAL FOREIGN KEY (CODIGO_SUCURSAL) REFERENCES SUCURSAL (CODIGO_SUCURSAL)
);


INSERT ALL
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp001','Samuel','Martínez','3356975143','samuel.martinez@candycol.com','SUCU001','vendedor oficina')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp002','Carlos','González','3356975144','carlos.gonzalez@candycol.com','SUCU002','vendedor online')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp003','Dilza','Rodríguez','3356975145','dilza.rodriguez@candycol.com','SUCU003','vendedor oficina')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp004','Andrés','Fernández','3356975146','andres.fernandez@candycol.com','SUCU004','vendedor online')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp005','Mariana','López','3356975147','mariana.lopez@candycol.com','SUCU005','vendedor oficina')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp006','Juan Pablo','Sánchez','3356975148','juanpablo.sanchez@candycol.com','SUCU006','vendedor online')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp007','Camila','Ramírez','3356975149','camila.ramirez@candycol.com','SUCU007','vendedor oficina')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp008','Sebastián','Torres','3356975150','sebastian.torres@candycol.com','SUCU008','vendedor online')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp009','Valentina','Morales','3356975151','valentina.morales@candycol.com','SUCU001','vendedor oficina')
    INTO EMPLEADO(codigo_empleado,nombre,apellido1,telefono,correo,codigo_sucursal,puesto) VALUES ('emp010','Mateo','Herrera','3356975152','mateo.herrera@candycol.com','SUCU002','vendedor online')
SELECT * FROM DUAL;


--#################################################TABLA CLIENTE#########################################
CREATE TABLE CLIENTE(
    codigo_cliente VARCHAR2(10),
    cedula NUMBER(12),
    nombre VARCHAR2(30),
    apellido VARCHAR2(30),
    telefono VARCHAR2(15),
    direccion VARCHAR2(100),
    ciudad VARCHAR2(30),
    codigo_empleado VARCHAR2(10),
    CONSTRAINT FK_EMPLEADO FOREIGN KEY (CODIGO_EMPLEADO) REFERENCES EMPLEADO (CODIGO_EMPLEADO)
);


--#########################################TABLA PEDIDO######################################################
CREATE TABLE PEDIDO_D (
    CODIGO_PEDIDO VARCHAR2(10) PRIMARY KEY,
    FECHA_PEDIDO DATE,
    FECHA_ESPERADA DATE,
    FECHA_ENTREGA DATE,
    ESTADO VARCHAR2(15),
    COMENTARIOS VARCHAR2(150),
    CODIGO_CLIENTE VARCHAR2(10),
    CONSTRAINT FK_CLIENTE_PEDIDO FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTE (CODIGO_CLIENTE)
);


--#############################################TABLA PAGO##################################################
CREATE TABLE PAGO_D (
    ID_TRANSACCION VARCHAR(10),
    CODIGO_CLIENTE VARCHAR(10),
    FORMA_PAGO VARCHAR(40),
    FECHA_PAGO DATE,
    TOTAL NUMBER(15,2) NOT NULL,
    CONSTRAINT FK_CLIENTE FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTE_D (CODIGO_CLIENTE)
);


--##########################################TABLA DETALLE PEDIDO#############################################
CREATE TABLE DETALLE_PEDIDO_D (
    CODIGO_PEDIDO     VARCHAR2(10),
    CODIGO_PRODUCTO   VARCHAR2(15),
    CANTIDAD          NUMBER(11) NOT NULL,
    PRECIO_TOTAL     NUMBER(15,2) NOT NULL,
    CONSTRAINT PK_DETALLE_PEDIDO PRIMARY KEY (CODIGO_PEDIDO, CODIGO_PRODUCTO),
    CONSTRAINT FK_PEDIDO FOREIGN KEY (CODIGO_PEDIDO) REFERENCES PEDIDO_D (CODIGO_PEDIDO),
    CONSTRAINT FK_PRODUCTO FOREIGN KEY (CODIGO_PRODUCTO) REFERENCES PRODUCTO (CODIGO_PRODUCTO)
);