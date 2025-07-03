/*########################################*/
/*######creado por Wendy Sarmiento#######*/
/*#########27 de Marzo 2025 ########*/
/*#########Dimension CUENTA_CONTABLE contiene todos los datos consernientes a las cuentas contables  Alliance Risk and Protection ltda  ########*/
	
CREATE TABLE DIM_CUENTA_CONTABLE (
    SK_NUM_DIM_CUENTA_CONTABLE   NUMBER(10) , 
    NUM_ID_CIA  NUMBER(3),   
    NUM_ID_AUXILIAR NUMBER(12),
    NUM_NIVEL_CUENTA NUMBER(2),              
    NUM_CUENTA_PADRE  NUMBER(20),   
    STR_DESCRIPCION_CUENTA_PADRE VARCHAR2(50),
    STR_CUENTA_MAYOR VARCHAR2(25),         
    STR_ID_CUENTA_AUXILIAR VARCHAR2(25),    
    STR_DESCRIPCION_AUXILIAR  VARCHAR2(50),       
    STR_PLAN_CONTABLE  VARCHAR2(3),
    STR_CLASIFICACION_CUENTA VARCHAR2(100),
    DT_FECHA_INICIO  DATE,
    DT_FECHA_ACTUALIZACION  DATE
);


/*#########  Tabla de area de preparacion para el proceso ETL de la dimension cuenta_contable  ########*/
CREATE TABLE STG_CUENTA_CONTABLE (
    NUM_ID_CIA  NUMBER(3),   
    NUM_ID_AUXILIAR NUMBER(12),
    NUM_NIVEL_CUENTA NUMBER(2),              
    NUM_CUENTA_PADRE  NUMBER(20),   
    STR_DESCRIPCION_CUENTA_PADRE VARCHAR2(50),
    STR_CUENTA_MAYOR VARCHAR2(25),         
    STR_ID_CUENTA_AUXILIAR VARCHAR2(25),    
    STR_DESCRIPCION_AUXILIAR  VARCHAR2(50),       
    STR_PLAN_CONTABLE  VARCHAR2(3),
    STR_CLASIFICACION_CUENTA VARCHAR2(100)
);




/*######### Secuencia incremental para la dimension cuenta_contable ########*/

CREATE SEQUENCE SEQ_SK_DIM_CUENTA_CONTABLE
START WITH 1
INCREMENT BY 1
NOCACHE;

/*######### Indice unico para las claves compuenstas de la dimension cuenta_contable ########*/
CREATE UNIQUE INDEX IDX_UK_DIM_CUENTA_CONTABLE
ON DIM_CUENTA_CONTABLE (NUM_ID_CUENTA_AUXILIAR,NUM_ID_CIA);



/*######### comentarios que describen cada atributo de la dimension cuenta_contable ########*/

COMMENT ON COLUMN DIM_CUENTA_CONTABLE.SK_NUM_DIM_CUENTA_CONTABLE IS 'secuencia única generada automáticamente para identificar las cuentas contables SK;
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.NUM_CUENTA_MAYOR IS 'identificador de la cuenta mayor dentro del plan contable.';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.NUM_ID_CIA IS 'Identificador de la compañía o entidad a la que pertenece la cuenta contable.';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.STR_NOMBRE_CUENTA_MAYOR IS 'Nombre descriptivo de la cuenta mayor.';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.NUM_ID_CUENTA_AUXILIAR IS 'identificador de la cuenta auxiliar';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.STR_NOMBRE_CUENTA_AUXILIAR IS 'Nombre descriptivo de la cuenta auxiliar';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.NUM_NATURALEZA IS 'Indica la naturaleza de la cuenta (0: Débito/1:Crédito).';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.NUM_NIVEL_CUENTA IS 'Nivel jerárquico de la cuenta dentro del plan contable 1. Grupo 2. Clase 3. Cuenta 4. Subcuenta 5. SubSubCuenta';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.NUM_ESTADO_CUENTA IS 'Estado de la cuenta (1=Activa, 2=Inactiva)';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.STR_PLAN_CONTABLE IS 'Código del plan contable asociado a la cuenta';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.DT_FECHA_INICIO IS 'Plan contable ( NIF )';
COMMENT ON COLUMN DIM_CUENTA_CONTABLE.DT_FECHA_ACTUALIZACION IS 'Última fecha de actualización de la cuenta contable';
