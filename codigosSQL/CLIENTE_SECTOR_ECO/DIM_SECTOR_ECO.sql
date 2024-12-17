/*
########## Creado por: Sebastián Carrero ##########
########## Fecha De Creacion: 9/12/24 #############
########## Dimension Sector Economico, encargada de almacenar 
los datos de los sectores economico en los cuales operan los clientes #############
*/


/*=======================================================
########## DIMENSION SECTOR ECONOMICO ##########
=========================================================*/
CREATE TABLE DIM_SECTOR_ECO (
    SK_NUM_DIM_SECTOR NUMBER(7) COMMENT 'SECUENCIA GENERADA AUTOMÁTICAMENTE', 
    NUM_CODIGO_SECTOR NUMBER(6) COMMENT 'IDENTIFICADOR ÚNICO DEL SECTOR ECONÓMICO', 
    STR_SECTOR VARCHAR2(35) COMMENT 'NOMBRE DEL SECTOR ECONÓMICO', 
    DT_FECHA_INSERCION DATE COMMENT 'FECHA DE INSERCIÓN DE LOS REGISTROS', 
    DT_FECHA_ACTUALIZACION DATE COMMENT 'FECHA DE ACTUALIZACIÓN DE LOS REGISTROS', 
    DT_FECHA_FIN DATE COMMENT 'FECHA DE ELIMINACIÓN DEL REGISTRO'
);

/*=======================================================
########## INDICE UNICO ##########
=========================================================*/
CREATE UNIQUE INDEX IDX_NIT_STR_SUCURSAL
ON DIM_CLIENTE (NUM_NIT, STR_SUCURSAL);

/*=======================================================
########## SECUENCIA ##########
=========================================================*/
CREATE SEQUENCE SEQ_SK_DIM_SECTOR_ECO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

/*===================================================================
########## TRIGGER PARA LLENAR LA FECHA DE ACTUALIZACION ##########
=====================================================================*/
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_FECHA_DIM_SECTOR_ECO
BEFORE UPDATE ON DIM_SECTOR_ECO
FOR EACH ROW
WHEN (OLD.STR_SECTOR != NEW.STR_SECTOR)
BEGIN    
    :NEW.DT_FECHA_ACTUALIZACION := SYSDATE;
END;
/


