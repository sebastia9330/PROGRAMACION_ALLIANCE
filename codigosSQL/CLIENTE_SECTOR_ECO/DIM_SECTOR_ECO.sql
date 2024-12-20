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
    SK_NUM_DIM_SECTOR NUMBER(7),
    NUM_CODIGO_SECTOR NUMBER(6),
    STR_SECTOR VARCHAR2(35),
    DT_FECHA_INICIO DATE, 
    DT_FECHA_ACTUALIZACION DATE
);


/*=======================================================
########## COMENTARIOS ##########
=========================================================*/

COMMENT ON COLUMN DIM_SECTOR_ECO.SK_NUM_DIM_SECTOR IS 'SECUENCIA GENERADA AUTOMÁTICAMENTE';
COMMENT ON COLUMN DIM_SECTOR_ECO.NUM_CODIGO_SECTOR IS 'IDENTIFICADOR ÚNICO DEL SECTOR ECONÓMICO';
COMMENT ON COLUMN DIM_SECTOR_ECO.STR_SECTOR IS 'NOMBRE DEL SECTOR ECONÓMICO';
COMMENT ON COLUMN DIM_SECTOR_ECO.DT_FECHA_INICIO IS 'FECHA DE INSERCIÓN DE LOS REGISTROS';
COMMENT ON COLUMN DIM_SECTOR_ECO.DT_FECHA_ACTUALIZACION IS 'FECHA DE ACTUALIZACIÓN DE LOS REGISTROS';



/*=======================================================
########## INDICE UNICO ##########
=========================================================*/
CREATE UNIQUE INDEX IDX_NIT_STR_SUCURSAL
ON DIM_SECTOR_ECO (NUM_CODIGO_SECTOR);

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


