/*
########## Creado por: Sebastian Carrero ##########
########## Fecha De Creacion: 6/12/24 #############
########## Tabla Stagin que almacena los datos extraidos del data store #############
*/




/*=======================================================
########## TABLA STAGING CLIENTES ##########
=========================================================*/
CREATE TABLE STG_CLIENTE(
    NUM_ID_CIA NUMBER(4),
    NUM_ID_CLIENTE NUMBER(10),
    STR_NIT VARCHAR2(25),
    STR_RAZON_SOCIAL VARCHAR2(100),
    STR_SUCURSAL VARCHAR2(4),
    STR_RAZON_SOCIAL_SUCURSAL VARCHAR2(100),
    STR_TELEFONO VARCHAR2(25),
    STR_DIRECCION VARCHAR2(150),
    STR_CORREO VARCHAR2(100),
    STR_CONTACTO_PRINCIPAL VARCHAR2(100),
    DT_FECHA_INGRESO DATE,
    STR_ANTIGUEDAD VARCHAR2(20),
    STR_CALIFICACION VARCHAR2(5),
    STR_CONDICION_DE_PAGO VARCHAR2(5),
    STR_DESC_CONDICION_DE_PAGO VARCHAR2(40),
    NUM_BLOQUEO_CUPO NUMBER(2),
    NUM_BLOQUEO_MORA NUMBER(2),
    STR_CARTERA	VARCHAR2(35),
    STR_FACTURACION VARCHAR2(25),
    STR_SECTOR_ECONOMICO VARCHAR2(35),
    STR_TIPO_EMPRESA VARCHAR2(20)
);