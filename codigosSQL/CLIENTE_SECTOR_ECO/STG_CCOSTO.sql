/*
########## Creado por: Sebastian Carrero ##########
########## Fecha De Creacion: 6/05/25 #############
########## Tabla Stagin que almacena ##############
########## los datos extraidos de los #############
########## Centros de Costo #######################
*/



/*=======================================================
########## TABLA STAGING CLIENTES ##########
=========================================================*/
CREATE TABLE STG_CCOSTO(
    NUM_ID_CCOSTO NUMBER(7),
    STR_ID_CCOSTO_MAYOR VARCHAR2(15),
    STR_ID_CCOSTO_AUXILIAR VARCHAR2(15),
    STR_CCOSTO_NOMBRE VARCHAR2(40),
    STR_CCOSTO_GRUPO VARCHAR2(5)
);