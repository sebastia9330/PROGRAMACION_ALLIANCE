/*########################################*/
/*######creado por Wendy Sarmiento#######*/
/*#########06 de Diciembre 2024 ########*/
/*#########Dimension servicios contiene todos los datos consernientes a los servicios que presta Alliance Risk and Protection ltda  ########*/

	
/*=================================================================
######### Tabla de area de preparacion para el proceso ETL ########
=================================================================*/
CREATE TABLE STG_SERVICIOS (
NUM_CODIGO NUMBER (10), 
STR_NOMBRES VARCHAR2(50));


/*=======================================================
################## DIMENSION SERVICIOS ##################
=========================================================*/
CREATE TABLE DIM_SERVICIOS (
SK_ID_SERVICIOS NUMBER,
NUM_CODIGO NUMBER (10), 
STR_NOMBRES VARCHAR2(50),
DT_FECHA_INICIO DATE,
DT_FECHA_ACTUALIZACION DATE,
);

/*=======================================================
###################### COMENTARIOS ######################
=========================================================*/

COMMENT ON COLUMN DIM_SERVICIOS.SK_ID_SERVICIOS IS 'secuencia única generada automáticamente para identificar los SERVICIOS';
COMMENT ON COLUMN DIM_SERVICIOS.NUM_CODIGO IS 'Código numérico único que identifica el servicio de manera externa';
COMMENT ON COLUMN DIM_SERVICIOS.STR_NOMBRES IS 'Nombre del servicio proporcionado';
COMMENT ON COLUMN DIM_SERVICIOS.DT_FECHA_INICIO IS 'Fecha de inicio del registro valido de dim_servicios';
COMMENT ON COLUMN DIM_SERVICIOS.DT_FECHA_ACTUALIZACION IS 'Fecha en la que se realizó la última actualización del registro';



/*=======================================================
################ INDICE UNICO COMPUESTO ################
=======================================================*/
CREATE UNIQUE INDEX IDX_UK_DIM_SERVICIOS 
ON DIM_SERVICIOS (NUM_CODIGO);	

/*=======================================================
####################### SECUENCIA #######################
=========================================================*/

CREATE SEQUENCE SEQ_SK_DIM_SERVICIOS
START WITH 1
INCREMENT BY 1
NOCACHE;





