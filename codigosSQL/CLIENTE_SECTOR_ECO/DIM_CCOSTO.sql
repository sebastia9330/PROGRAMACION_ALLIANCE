/*
########## Creado por: Sebastian Carrero ##########
########## Fecha De Creacion: 6/12/24 #############
########## Dimension CCosto, encargada de almacenar los datos de los centros de costo #############
*/


/*=======================================================
########## DIMENSION CENTRO COSTO ##########
=========================================================*/
CREATE TABLE DIM_CCOSTO(
    SK_NUM_DIM_CCOSTO NUMBER(7)
    NUM_ID_CCOSTO NUMBER(7),
    STR_ID_CCOSTO_MAYOR VARCHAR2(15),
    STR_ID_CCOSTO_AUXILIAR VARCHAR2(15),
    STR_CCOSTO_NOMBRE VARCHAR2(50),
    STR_CCOSTO_GRUPO VARCHAR2(5), 
    DT_FECHA_INICIO DATE,
    DT_FECHA_ACTUALIZACION DATE
);


/*=======================================================
########## SECUENCIA ##########
=========================================================*/
CREATE SEQUENCE SEQ_SK_DIM_CCOSTO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;