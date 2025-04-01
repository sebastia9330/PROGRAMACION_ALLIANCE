/*
########## Creado por: Sebastian Carrero ##########
########## Fecha De Creacion: 27/03/25 #############
########## STG_FINANCIENRA #############
*/

/*=======================================================
########## STAGING FINANCIERA ##########
=========================================================*/


CREATE TABLE STG_FAC_FINANCIERA(
    NUM_EMPRESA NUMBER(3,0), --CODIGO DE COMPAÑIA
    STR_TERCERO_NIT VARCHAR2(25), --NIT DEL CLIENTE
    DT_FECHA_DOCTO DATE, --FECHA DEL DOCUMENTO
    NUM_CUENTA_CONTABLE NUMBER(10), --CUENTA CONTABLE DEL DOCUMENTO
    STR_ID_SERVICIO VARCHAR2(25), --ID DEL SERVICIO
    NUM_ID_SECTOR_ECONOMICO NUMBER(5), --ID DEL SECTOR ECONOMICO
    NUM_LINEA_ID_MOVTO NUMBER(9,0), --ID DEL MOVIMIENTO
    NUM_LINEA_ID_DOCTO NUMBER(8,0), --ID DEL DOCUMENTO
    STR_ID_TIPO_DOCTO VARCHAR2(3), --tipo de documento ej(CC, CM)
    NUM_DEBITO NUMBER(19,2), --debito, medida numerica
	NUM_CREDITO NUMBER(19,2) --credito, medida numerica
);